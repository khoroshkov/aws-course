#!/bin/bash
aws s3api get-object --bucket ${s3-bucket} --key ${source-file} ${destination-file}