#!/usr/bin/env bash

set -e -x


apt-get update
apt-get -y install openjdk-8-jre-headless

dpkg --force-architecture -i /tmp/debian-package/daemon-demo.deb
systemctl enable daemon-demo.service
systemctl start daemon-demo.service
