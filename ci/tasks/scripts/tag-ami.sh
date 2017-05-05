#!/bin/bash
# vim: set ft=sh

set -x -e

export AMI_ID=`jq --raw-output '.builds[0].artifact_id | split(":")[1]' < packer-manifest/packer-manifest.json`
export AWS_REGION=`jq --raw-output '.builds[0].artifact_id | split(":")[0]' < packer-manifest/packer-manifest.json`

aws ec2 create-tags --region ${AWS_REGION} --resources ${AMI_ID} --tags Key=state,Value=good