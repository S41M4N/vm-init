#!/usr/bin/env bash
# Author: Salman Kha

set -e

function command_exist() {
  type "$1" >/dev/null 2>&1
}

sudo apt update

[[! command_exist "unzip"]] && sudo apt install unzip
[[! command_exist "curl"]] && sudo apt install curl

mkdir temp
cd temp

curl -L -o server.zip "https://github.com/S41M4N/vm-init/archive/main.zip"
unzip server.zip
mv vm-init-main/* .
bash ./install.sh

cd ../
rm -rf temp
