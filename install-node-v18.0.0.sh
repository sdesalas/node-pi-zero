#!/bin/bash
# By Steven de Salas

# Based on script by Richard Stanley @ https://github.com/audstanley/Node-MongoDb-Pi/
# This is for a RaspberryPi Zero but should work across all models.

VERSION=v18.0.0;

# Creates directory for downloads, and downloads node
cd ~/ && mkdir temp && cd temp;
wget https://unofficial-builds.nodejs.org/download/release/$VERSION/node-$VERSION-linux-armv6l.tar.gz;
tar -xzf node-$VERSION-linux-armv6l.tar.gz;
# Remove the tar after extracing it.
sudo rm node-$VERSION-linux-armv6l.tar.gz;
# This line will clear existing nodejs
sudo rm -rf /opt/nodejs;
# This next line will copy Node over to the appropriate folder.
sudo mv node-$VERSION-linux-armv6l /opt/nodejs/;
# Remove existing symlinks
sudo unlink /usr/bin/node;
sudo unlink /usr/sbin/node;
sudo unlink /sbin/node;
sudo unlink /usr/local/bin/node;
sudo unlink /usr/bin/npm;
sudo unlink /usr/sbin/npm;
sudo unlink /sbin/npm;
sudo unlink /usr/local/bin/npm;
sudo unlink /usr/bin/npx;
sudo unlink /usr/sbin/npx;
sudo unlink /sbin/npx;
sudo unlink /usr/local/bin/npx;
# Create symlinks to node && npm && npx
sudo ln -s /opt/nodejs/bin/node /usr/bin/node;
sudo ln -s /opt/nodejs/bin/node /usr/sbin/node;
sudo ln -s /opt/nodejs/bin/node /sbin/node;
sudo ln -s /opt/nodejs/bin/node /usr/local/bin/node;
sudo ln -s /opt/nodejs/bin/npm /usr/bin/npm;
sudo ln -s /opt/nodejs/bin/npm /usr/sbin/npm;
sudo ln -s /opt/nodejs/bin/npm /sbin/npm;
sudo ln -s /opt/nodejs/bin/npm /usr/local/bin/npm;
sudo ln -s /opt/nodejs/bin/npx /usr/bin/npx;
sudo ln -s /opt/nodejs/bin/npx /usr/sbin/npx;
sudo ln -s /opt/nodejs/bin/npx /sbin/npx;
sudo ln -s /opt/nodejs/bin/npx /usr/local/bin/npx;

