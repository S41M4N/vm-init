#!/usr/bin/env bash
# Author: Salman Kha

sudo apt update
sudo apt install -y xrdp
sudo apt install -y xfce4
sudo service xrdp restart

sudo -s
