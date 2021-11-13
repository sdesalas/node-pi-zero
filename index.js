const fetch = require('node-fetch');
const fs = require('fs');

fetch('https://unofficial-builds.nodejs.org/download/release/index.json')
    .then(res => res.json())
    .then(json => {
        json.forEach(element => {
            console.log(element.version);
            try {
                if (fs.existsSync('./install-node-'+element.version+'.sh')) {
                  console.log('File exists');
                }else{
                    let content = ''
                    try {
                        const data = fs.readFileSync('./install-node-v.example.sh', 'utf8')
                        console.log(data)
                        content = data.replace('{{version}}', element.version)
                    } catch (err) {
                        console.error(err)
                    }
                    fs.writeFile('./install-node-'+element.version+'.sh', content, err => {
                        if (err) {
                          console.error(err)
                          return
                        }
                        //file written successfully
                      })
                }
              } catch(err) {
                console.error(err)
              }
        });
    });