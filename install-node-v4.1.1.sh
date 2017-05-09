#!/bin/bash
# By Steven de Salas
# Generation code by David Gray

# Based on script by Richard Stanley @ https://github.com/audstanley/Node-MongoDb-Pi/
# This is for a RaspberryPi Zero but should work across all models.

# Parameters delimited with @@ will be replaced when the generation script is run

VERSION=v4.1.1;
ARCH=armv6l;
MIRROR=https://nodejs.org/dist/;

# Creates directory for downloads, and downloads node
cd ~/ && mkdir temp && cd temp;
wget ${MIRROR}$VERSION/node-$VERSION-linux-$ARCH.tar.gz;
tar -xzf node-$VERSION-linux-$ARCH.tar.gz;
# Remove the tar after extracing it.
sudo rm node-$VERSION-linux-$ARCH.tar.gz;
# This line will clear existing nodejs
sudo rm -rf /opt/nodejs;
# This next line will copy Node over to the appropriate folder.
sudo mv node-$VERSION-linux-$ARCH /opt/nodejs/;
# Remove existing symlinks
sudo unlink /usr/bin/node;
sudo unlink /usr/sbin/node;
sudo unlink /sbin/node;
sudo unlink /usr/local/bin/node;
sudo unlink /usr/bin/npm;
sudo unlink /usr/sbin/npm;
sudo unlink /sbin/npm;
sudo unlink /usr/local/bin/npm;
# Create symlinks to node && npm
sudo ln -s /opt/nodejs/bin/node /usr/bin/node;
sudo ln -s /opt/nodejs/bin/node /usr/sbin/node;
sudo ln -s /opt/nodejs/bin/node /sbin/node;
sudo ln -s /opt/nodejs/bin/node /usr/local/bin/node;
sudo ln -s /opt/nodejs/bin/npm /usr/bin/npm;
sudo ln -s /opt/nodejs/bin/npm /usr/sbin/npm;
sudo ln -s /opt/nodejs/bin/npm /sbin/npm;
sudo ln -s /opt/nodejs/bin/npm /usr/local/bin/npm;
# Add bin to $PATH (so globally installed modules will work)
echo "PATH=/opt/nodejs/bin:$PATH" >> ~/.bashrc
export PATH=/opt/nodejs/bin:$PATH
