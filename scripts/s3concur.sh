#!/bin/sh

# This tiny POSIX script requires s3-sign: https://github.com/BashtonLtd/s3-sign
# Author: Raf <dev@rafalop.es>

s3bucket="freitasrtempfiles"
s3prefix="expensereports"
period="3600"

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
s3-sign $s3bucket $s3prefix/$1 $period | pbcopy || exit_on_error "[ERROR] - Failed to generate signed URL"
green_message "[INFO] signed URL generated for $s3bucket/$s3prefix/$1 and added to your clipboard"
