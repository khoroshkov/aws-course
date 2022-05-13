
#!/bin/bash

aws dynamodb list-tables --region us-west-2

# write into table
aws dynamodb put-item --table-name "AWS_USERS_TABLE" --item '{ "USER_ID": { "N": "43" }, "USER_NAME": { "S": "Yen Frost" }, "ACCOUNT_STATUS": { "S": "premium" } }' --region us-west-2
aws dynamodb put-item --table-name "AWS_USERS_TABLE" --item '{ "USER_ID": { "N": "763" }, "USER_NAME": { "S": "Hloe Jankins" }, "ACCOUNT_STATUS": { "S": "free" } }' --region us-west-2

# get 1 record from db
aws dynamodb get-item --table-name "AWS_USERS_TABLE" --key '{"USER_ID":{"N":"43"}}' --region us-west-2

# get all records from tabel
aws dynamodb scan --table-name "AWS_USERS_TABLE" --region us-west-2