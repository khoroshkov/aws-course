#! /usr/bin/env bash

aws s3 mb s3://db-mkhoroshkov-scripts
aws s3 put-bucket-versioning --bucket db-mkhoroshkov-scripts --versioning-configuration status=enabled
aws s3 cp rds-script.sql s3://db-mkhoroshkov-scripts/
aws s3 cp dynamodb-script.sh s3://db-mkhoroshkov-scripts/