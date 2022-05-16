#!/bin/bash

aws sqs send-message --queue-url https://sqs.us-west-2.amazonaws.com/458152836477/my-aws-testing-queue --message-body 'testing aws sqs service. My first message in sqs' --delay-seconds 10  --region us-west-2

aws sqs receive-message --queue-url https://sqs.us-west-2.amazonaws.com/458152836477/my-aws-testing-queue-2 --region us-west-2