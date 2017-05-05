#!/bin/bash
# vim: set ft=sh

set -x

export AMI_ID=`jq --raw-output '.builds[0].artifact_id | split(":")[1]' < packer-manifest/packer-manifest.json`
export AWS_REGION=`jq --raw-output '.builds[0].artifact_id | split(":")[0]' < packer-manifest/packer-manifest.json`

RND=`date +%s`
export AWS_SSH_KEY_ID=TestKitchen_${RND}

aws ec2 create-key-pair --region ${AWS_REGION} --key-name ${AWS_SSH_KEY_ID} --query 'KeyMaterial' --output text > ${HOME}/test_kitchen.pem || exit 1
chmod 400 ${HOME}/test_kitchen.pem
export SSH_KEY_PATH=${HOME}/test_kitchen.pem

cd boot-daemon/ci/tests
kitchen test
ret_code=$?

aws ec2 delete-key-pair --region ${AWS_REGION} --key-name ${AWS_SSH_KEY_ID}

exit $ret_code