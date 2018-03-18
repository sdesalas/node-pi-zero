#!/bin/bash
# By Dave Johnson (@thisDaveJ)

# Leveraging prior work of:
#  Steven de Sales https://github.com/sdesalas/node-pi-zero/
#  Kees C. Bakker https://raw.githubusercontent.com/sdesalas/node-pi-zero/master/install-node-v.last.sh

install_node () {
  echo "Installing node $1";
  wget -O - https://raw.githubusercontent.com/sdesalas/node-pi-zero/master/install-node-v.lts.sh | bash
}

#get pi ARM version
PI_ARM_VERSION=$(uname -a | egrep 'armv[0-9]+l' -o);

#read the first version that matches the arm platform
NODE_VERSION=$(
  curl -s https://nodejs.org/dist/index.json | 
  egrep "{\"version\":\"v([0-9]+\.?){3}\"[^{]*\"linux-"$PI_ARM_VERSION"[^}]*lts\":\"[^\"]+\"" -o |
  head -n 1
);

#get the version
LATEST_LTS_VERSION=$(
  echo $NODE_VERSION | 
  egrep 'v([0-9]+\.?){3}' -o
);

if ! [ -x "$(command -v node)" ]; then
  while true; do
    read -p "node is not installed. Install latest LTS version now (y/n)? " yn
    case $yn in
      [Yy]* ) install_node $LATEST_LTS_VERSION
              exit;;
      [Nn]* ) exit;;
      * ) echo "Please answer with y or n."
              ;;
    esac
  done
fi

CURRENT_NODE_VERSION=$(node -v);

if [ "$CURRENT_NODE_VERSION" != "$LATEST_LTS_VERSION" ]; then
  echo "node current version: $CURRENT_NODE_VERSION";
  echo "node latest LTS version: $LATEST_LTS_VERSION";
  while true; do
    read -p "Do you wish to install the latest LTS version (y/n)? " yn
    case $yn in
      [Yy]* ) install_node $LATEST_LTS_VERSION
              exit;;
      [Nn]* ) exit;;
      * ) echo "Please answer with y or n."
              ;;
    esac
  done
else
  echo "You have node $CURRENT_NODE_VERSION installed which is the latest LTS version."
fi
