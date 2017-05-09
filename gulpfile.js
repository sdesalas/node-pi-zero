// Change this to match your GitHub username
var username = "grayda"
var architecture = "armv6l"
var gulp = require('gulp');
var gutil = require('gulp-util');
var fs = require("fs")
var async = require("async")

var http = require('http')
var GetNodeVersions = require("get-node-versions").GetNodeVersions

gulp.task('generate', function() {
  var validVersions = []
  var template = fs.readFileSync("./templates/install-node-template.txt", "utf8")
  fs.writeFileSync("README.md", fs.readFileSync("./templates/readme-template.txt", "utf8"))
  gutil.log("Requesting all node versions..")
  GetNodeVersions.parse(["all"]).then(function(versions) {
    async.map(versions, function(version, next) {
      options = {method: 'HEAD', host: "nodejs.org", port: 80, path: '/dist/v' + version + "/node-v" + version + "-linux-armv6l.tar.gz"}
      req = http.request(options, function(r, err) {
        if(r.statusCode == "200") {
          gutil.log(gutil.colors.green("v" + version + " has an armv61 build. Writing install script.."))
          validVersions.push(version)
          next(null, version)
        } else {
          gutil.log(gutil.colors.red("v" + version + " has no armv61 build. Skipping.."))
          next(null, null)
        }
      });
      req.end();
    }, function() {
      validVersions.sort().reverse().forEach(function(version) {
        gutil.log("Writing " + version + " to file")
        fs.writeFile("./install-node-v" + version + ".sh", template.replace("@@VERSION@@", version).replace("@@ARCH@@", architecture).replace("@@MIRROR@@", GetNodeVersions.NODEJS_MIRROR))
        fs.appendFileSync("README.md", ["## v" + version, "", "```sh", "$ wget https://raw.githubusercontent.com/" + username + "/node-pi-zero/master/install-node-v" + version + ".sh -O /tmp/install-node-v" + version + ".sh && source /tmp/install-node-v" + version + ".sh", "```", "", ""].join("\n"))
      })
      gutil.log(gutil.colors.cyan("Wrote " + validVersions.length + " versions"))
    })
  })
})
