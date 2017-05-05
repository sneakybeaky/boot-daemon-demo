#!/bin/bash
# vim: set ft=sh

set -e -x

pushd boot-daemon/ci/packer
    packer build -var-file=../../../ubuntu-ami/packer.json ubuntu.json
popd

cp  boot-daemon/ci/packer/packer-manifest.json built-artifact/packer-manifest.json