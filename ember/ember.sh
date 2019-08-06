#!/usr/bin/env bash

set -ex

export DEBIAN_FRONTEND=noninteractive

CHECKFILE="/vagrant/ember/hello-world"

if [ -z "$(getent passwd vagrant)" ]; then
        # disable `apt-daily.service` on Ubuntu - cloud VM image
        systemctl stop apt-daily.service
        systemctl kill --kill-who=all apt-daily.service
        sudo apt-get update -y
        which unzip &>/dev/null || {
        sudo apt-get install -y unzip
        }
        wget https://github.com/chavo1/hello-world/archive/0.0.5.zip && unzip 0.0.5.zip
        mv hello-world-0.0.5 /home/ubuntu/hello-world
        cd /home/ubuntu/hello-world  
else
    if [ ! -d "$CHECKFILE" ]; then
        sudo apt-get update -y
        which git &>/dev/null || {
        apt-get install -y git
        }
        pushd /vagrant/ember
            git clone https://github.com/chavo1/hello-world.git
        popd
            cp -R /vagrant/ember/hello-world /home/vagrant/ && cd /home/vagrant/hello-world
        else
            cp -R /vagrant/ember/hello-world /home/vagrant/ && cd /home/vagrant/hello-world
    fi
fi

# starting ember

echo starting ember...
sudo npm install
sudo systemctl start ember

if [ $? -eq 0 ]; then
    echo Ember started
else
    echo Ember not started
    exit 1
fi

set +x