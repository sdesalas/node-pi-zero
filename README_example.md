![Node Pi Zero](https://raw.githubusercontent.com/sdesalas/node-pi-zero/eb55d80c724950137b79dbeded540789dc3cf455/pizero.png)

# node-pi-zero

Use the commands below to install node in the Raspberry Pi Zero.

They are re-runnable so you can upgrade or downgrade just by running the command for each version.

## Node in v12+: Experimental 

As of Node v12, the [Node.js project](https://github.com/nodejs/node/) has stopped supporting the Raspberry Pi Zero's [ARM v6 chip](https://en.wikipedia.org/wiki/ARM11) and is now [classing it as "Experimental"](https://github.com/nodejs/build/issues/1677), so you can no longer download a tarball binary directly from the [main project](https://github.com/nodejs/node). The install scripts here are using the [Unofficial Builds Project](https://github.com/nodejs/unofficial-builds/) (run by the same team).

"Experimental" status for Node.js is defined as:

> Experimental: May not compile or test suite may not pass. The core team does not create releases for these platforms. Test failures on experimental platforms do not block releases. Contributions to improve support for these platforms are welcome.

For more info:

https://raspberrypi.stackexchange.com/questions/111130/how-to-install-nodejs-v12-on-raspi-zero-armv6-not-available-for-download-anymor

{{testlink}}

## Using global npm modules? (ie mocha, eslint, etc)

Add the following to the end of your `~/.profile` file:
```sh
# Add support for node CLI tools
export PATH=$PATH:/opt/nodejs/bin
```

And remember, [friends dont let friends pipe to sh](https://www.seancassidy.me/dont-pipe-to-your-shell.html).
