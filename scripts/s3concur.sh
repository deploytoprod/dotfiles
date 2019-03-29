#!/bin/sh
# Author: Raf <dev@rafalop.es>

s3bucket="oneaccessonly"
s3prefix="mula"

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

aws s3 cp $1 s3://$s3bucket/$s3prefix/ || exit_on_error "[ERROR] - Failed to upload to S3"
green_message "[INFO] $1 uploaded to s3"
aws s3 presign s3://$s3bucket/$s3prefix/$1 | pbcopy || exit_on_error "[ERROR] - Failed to generate signed URL"
green_message "[INFO] signed URL generated for $s3bucket/$s3prefix/$1 and added to your clipboard, valid for 1h."
