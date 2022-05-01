#! /usr/bin/env bash

cd week-02
cat > test.txt
echo "This is a sample .txt file to upload to Amazon s3 bucket" >> test.txt

aws s3 mb s3://test-bucket-mkhoroshkov --acl public-read-write
aws s3 put-bucket-versioning --bucket test-bucket-mkhoroshkov --versioning-configuration status=enabled
aws s3 cp week-02/test.txt s3://test-bucket-mkhoroshkov/test.txt