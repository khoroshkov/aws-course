#!/bin/bash

sudo su
    
yum -y update 
yum -y install java-1.8.0-openjdk

aws s3api get-object --bucket ${s3_bucket_name} --key calc-2021-0.0.1-SNAPSHOT.jar calc-2021-0.0.1-SNAPSHOT.jar
java -jar calc-2021-0.0.1-SNAPSHOT.jar