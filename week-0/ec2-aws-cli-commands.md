# 1. create secret key pair

## aws ec2 create-key-pair --key-name <name>

# 2. create security group

## aws ec2 describe-vpcs

## copy VpcId

## aws ec2 create-security-group --group-name <group-name> --description "<>description" --vpc-id <VpcId>

# 3. setup security role

## aws ec2 authorize-security-group-ingress --group-id <group-id> --protocol tcp --port 22 --cidr 0.0.0.0/0

# 4 create ec2 instance

## aws ec2 run-instances --image-id <ima-id> --count 1 --instance-type t2.micro --key-name <key-name> --security-group-ids <group-id> --subnet-id <subnet-id>

### online-resource: https://www.youtube.com/watch?v=sIx7MO4rcCU&ab_channel=JustmeandOpensource
