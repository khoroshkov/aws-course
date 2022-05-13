#!/bin/bash
aws s3api get-object --bucket ${s3-bucket} --key ${sql-script-file} ${sql-script-file}
aws s3api get-object --bucket ${s3-bucket} --key ${dynamodb-script-file} ${dynamodb-script-file}