#!/bin/bash
# By Steven de Salas

# Based on script by Richard Stanley @ https://github.com/audstanley/Node-MongoDb-Pi/
# This will work specifically for a RaspberryPi Zero.

# Creates directory for downloads, and downloads node 6.3.1
cd ~/ && mkdir temp && cd temp;
wget https://nodejs.org/dist/v6.3.1/node-v6.3.1-linux-armv6l.tar.gz;
tar -xzf node-v6.3.1-linux-armv6l.tar.gz;
# Remove the tar after extracing it.
sudo rm node-v6.3.1-linux-armv6l.tar.gz;
# This next line will copy Node over to the appropriate folder.
sudo mv node-v6.3.1-linux-armv6l/ /opt/nodejs/;
# Create symlinks to node && npm
sudo ln -s /opt/nodejs/bin/node /usr/bin/node;
sudo ln -s /opt/nodejs/bin/node /usr/sbin/node;
sudo ln -s /opt/nodejs/bin/node /sbin/node;
sudo ln -s /opt/nodejs/bin/node /usr/local/bin/node;
sudo ln -s /opt/nodejs/bin/npm /usr/bin/npm;
sudo ln -s /opt/nodejs/bin/npm /usr/sbin/npm;
sudo ln -s /opt/nodejs/bin/npm /sbin/npm;
sudo ln -s /opt/nodejs/bin/npm /usr/local/bin/npm;
