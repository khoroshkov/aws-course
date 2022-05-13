terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
  access_key = "**********"
  secret_key = "**********"
}

# Configure action template to copy scripts at startup
data "template_file" "copy-script-files" {
  template = "${file("copy-files.sh.tpl")}"

  vars = {
    s3-bucket                 = var.aws_s3_bucket_name
    sql-script-file           = "rds-script.sql"
    dynamodb-script-file      = "dynamodb-script.sh"
  }
}

# Create and configure the ec2 instance
resource "aws_instance" "ec2-dynamodb-server" {
    ami = var.ec2_ami_id
    instance_type = var.ec2_instance_type
    key_name = var.aws_ssh_key_name
    security_groups = [aws_security_group.ingress_ssh_sg.name, 
    aws_security_group.ingress_http_sg.name, 
    aws_security_group.ingress_for_rds.name,
    aws_security_group.egress_all_sg.name]

    iam_instance_profile = aws_iam_instance_profile.dynamodb_instance_profile.name
    

    user_data = data.template_file.copy-script-files.rendered
}

# Postgres config
resource "aws_db_instance" "postgres_db_instance" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "postgres"
  engine_version         = "12.3"
  instance_class         = "db.t2.micro"
  username               = "m-khoroshkov-lohika-cg"
  password               = "my-strong-password-01"
  vpc_security_group_ids = [aws_security_group.ingress_for_rds.id]
  skip_final_snapshot    = true
  publicly_accessible    = true
}

# Dynamo DB config
resource "aws_dynamodb_table" "dynamo_db_table_config" {
  name           = "AWS_USERS_TABLE"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "USER_ID"

  attribute {
    name = "USER_ID"
    type = "N"
  }
  attribute {
    name = "USER_NAME"
    type = "S"
  }
  attribute {
    name = "ACCOUNT_STATUS"
    type = "S"
  }

  tags = {
    Name        = "dynamodb-table-users"
    Environment = "development"
  }
}



output "public_id" {
  value = aws_instance.ec2-dynamodb-server.public_ip
}

output "rds_endpoint" {
  value = aws_db_instance.postgres_db_instance.endpoint
}
