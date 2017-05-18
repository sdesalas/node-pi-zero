#!/bin/bash
# By Steven de Sales

# 2017-04-20 Getting latest NodeJs version by Kees C. Bakker (KeesTalksTech)
# Based on script by Richard Stanley @ https://github.com/audstanley/Node-MongoDb-Pi/

#get pi ARM version
PI_ARM_VERSION=$(
  uname -a | 
  egrep 'armv[0-9]+l' -o
);

#get latest nodejs version from node website
#read the first version that matches the arm platform
NODE_VERSION=$(
  curl https://nodejs.org/dist/index.json | 
  egrep "{\"version\":\"v([0-9]+\.?){3}\"[^{]*\"linux-"$PI_ARM_VERSION"[^}]*lts\":\"[^\"]+\"" -o |
  head -n 1
);

#get the version
VERSION=$(
  echo $NODE_VERSION | 
  egrep 'v([0-9]+\.?){3}' -o
);

#get lts version
LTS_VERSION=$(echo $NODE_VERSION | 
  egrep '"[^"]+"$' -o | 
  egrep '[a-zA-Z]+' -o | 
  tr '[:upper:]' '[:lower:]'
);

# Creates directory for downloads, and downloads node
cd ~/ && mkdir temp && cd temp;
wget https://nodejs.org/dist/latest-$LTS_VERSION/node-$VERSION-linux-$PI_ARM_VERSION.tar.gz;
tar -xzf node-$VERSION-linux-$PI_ARM_VERSION.tar.gz;

# Remove the tar after extracing it.
sudo rm node-$VERSION-linux-$PI_ARM_VERSION.tar.gz;

# This line will clear existing nodejs
sudo rm -rf /opt/nodejs;

# This next line will copy Node over to the appropriate folder.
sudo mv node-$VERSION-linux-$PI_ARM_VERSION /opt/nodejs/;

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
