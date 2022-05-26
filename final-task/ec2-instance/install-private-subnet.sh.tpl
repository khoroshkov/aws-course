#!/bin/bash

sudo su

export RDS_HOST=${rds_address}
echo $RDS_HOST 

yum -y update 
yum -y install java-1.8.0-openjdk

aws s3api get-object --bucket mkhoroshkov-lohika-bucket --key persist3-2021-0.0.1-SNAPSHOT.jar persist3-2021-0.0.1-SNAPSHOT.jar
java -jar persist3-2021-0.0.1-SNAPSHOT.jar