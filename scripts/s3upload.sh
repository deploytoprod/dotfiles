#!/bin/sh
# Author: Raf <dev@rafalop.es>

s3bucket="freitasrtempfiles"
s3prefix="public"

function green_message() {
  echo "\033[32m$1\033[0m"
}
function red_message() {
  echo "\033[31m$1\033[0m"
}
function exit_on_error() {
  red_message "$1"
  exit 1
}

s3output=$(aws s3 cp $1 s3://$s3bucket/$s3prefix/) || exit_on_error "[ERROR] - Failed to upload to S3"
green_message "[INFO] $1 uploaded to s3"
objectname=$(echo $s3output | grep -o -E "\w+$")
aws s3api put-object-acl --bucket $s3bucket --key $s3prefix/$objectname --grant-read uri=http://acs.amazonaws.com/groups/global/AllUsers || exit_on_error "[ERROR] - Could not set S3 object ACL"
url=https://$s3bucket.s3.amazonaws.com/$s3prefix/$objectname
echo $url |pbcopy
green_message "[INFO] $url copied to clipboard."
