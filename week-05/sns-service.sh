#!/bin/bash

aws sns publish --topic arn:aws:sns:us-west-2:458152836477:first-test-sns --message 'testing aws sns service. My first test message' --region us-west-2