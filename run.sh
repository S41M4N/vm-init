#!/usr/bin/env bash
# Author: Salman Kha

set -e

sudo apt update

if ! command -v unzip &>/dev/null; then sudo apt install unzip; fi
if ! command -v curl &>/dev/null; then sudo apt install curl; fi

mkdir temp
cd temp

curl -L -o server.zip "https://github.com/S41M4N/vm-init/archive/main.zip"
unzip server.zip
mv vm-init-main/* .
bash ./install.sh

cd ../
rm -rf temp
