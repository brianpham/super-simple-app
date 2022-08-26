#!/bin/bash

# Downloads and install HCLEDIT

HCLEDIT_VERSION="0.2.6"
sudo apt install curl -y

mkdir -p $GITHUB_WORKSPACE/bin
cd $GITHUB_WORKSPACE/bin

sudo curl -sL https://github.com/minamijoyo/hcledit/releases/download/v$HCLEDIT_VERSION/hcledit_0.2.6_linux_amd64.tar.gz -o hcledit.tar.gz

tar -xf hcledit.tar.gz

chmod +x $GITHUB_WORKSPACE/bin/hcledit

./hcledit