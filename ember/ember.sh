#!/usr/bin/env bash

set -ex

export DEBIAN_FRONTEND=noninteractive

# disable `apt-daily.service` on Ubuntu - cloud VM image
systemctl stop apt-daily.service
systemctl kill --kill-who=all apt-daily.service
sudo apt-get update -y
which unzip &>/dev/null || {
sudo apt-get install -y unzip
}
pushd /home/ubuntu
    wget https://github.com/chavo1/hello-ember/releases/latest/download/www.zip && unzip www.zip
    pushd www/
    # starting ember
        echo starting ember...
popd

sudo systemctl start ember

set +x