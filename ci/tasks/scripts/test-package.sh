#!/bin/bash
# vim: set ft=sh

set -x

export AWS_REGION=eu-west-2
export PACKAGE_URL=`cat debian-candidate-package/url`

RND=`date +%s`
export AWS_SSH_KEY_ID=TestKitchen_Package_${RND}

aws ec2 create-key-pair --region ${AWS_REGION} --key-name ${AWS_SSH_KEY_ID} --query 'KeyMaterial' --output text > ${HOME}/test_kitchen.pem || exit 1
chmod 400 ${HOME}/test_kitchen.pem
export SSH_KEY_PATH=${HOME}/test_kitchen.pem

cd boot-daemon/ci/tests/package
kitchen test --destroy=always
ret_code=$?

aws ec2 delete-key-pair --region ${AWS_REGION} --key-name ${AWS_SSH_KEY_ID}

exit $ret_code