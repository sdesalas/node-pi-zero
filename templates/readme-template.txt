![Node Pi Zero](https://raw.githubusercontent.com/sdesalas/node-pi-zero/eb55d80c724950137b79dbeded540789dc3cf455/pizero.png)

# node-pi-zero

Use the commands below to install node in the Raspberry Pi Zero.

They are re-runnable so you can upgrade or downgrade just by running the command for each version.

When finished just check the node and npm versions.

```sh
$ node -v
$ npm -v
```

And remember, [friends don't let friends pipe to sh](https://www.seancassidy.me/dont-pipe-to-your-shell.html).

## Re-generating this list

To regenerate this list, run `gulp generate`

## Latest

```sh
$ wget https://raw.githubusercontent.com/grayda/node-pi-zero/master/install-node-latest.sh -O /tmp/install-node-latest.sh && source /tmp/install-node-latest.sh
```
