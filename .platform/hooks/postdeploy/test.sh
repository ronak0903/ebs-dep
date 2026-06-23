#!/bin/bash

set -e

echo "Post deploy hook running"

date > /tmp/postdeploy-date.txt

uname -a > /tmp/kernel-info.txt

echo "SUCCESS" > /tmp/postdeploy-success.txt