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
  access_key = "AKIAWVLAJPV66FHRA7GN"
  secret_key = "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"
}

# Importing module Dynamo DB
module "dynamo_db_table_config" {
  source = "./dynamo-db"
  dynamo_db_name = var.dynamo_db_name
}

# Importing module EC2 instance
module "ec2_instance" {
  source = "./ec2-instance"

  ec2_ami_id              = var.ec2_ami_id
  ec2_nat_ami_id          = var.ec2_nat_ami_id
  ec2_instance_type       = var.ec2_instance_type
  aws_ssh_key_name        = var.aws_ssh_key_name
  cidr_block_vpc          = var.cidr_block_vpc
  s3_bucket_name          = var.s3_bucket_name
  vpc_id                  = module.final_task_vpc.vpc_id
  public_subnet_first_id  = module.final_task_vpc.first_public_subnet_id
  public_subnet_second_id = module.final_task_vpc.second_public_subnet_id
  private_subnet_id       = module.final_task_vpc.first_private_subnet_id
  rds_address             = module.postgres_db_instance.rds_address
}

# Importing rds module
module "postgres_db_instance" {
  source = "./rds"

  final_task_first_private_subnet_id = module.final_task_vpc.first_private_subnet_id
  final_task_second_private_subnet_id = module.final_task_vpc.second_private_subnet_id
  final_task_vpc_id = module.final_task_vpc.vpc_id
}

# Importing sns module
module "final_task_sns_topic" {
  source = "./sns"
}

# Importing VPC module
module "final_task_vpc" {
  source = "./vpc"

  cidr_block = var.cidr_block_vpc

  cidr_block_first_public_subnet = var.cidr_block_first_public_subnet
  cidr_block_second_public_subnet = var.cidr_block_second_public_subnet
  cidr_block_first_private_subnet = var.cidr_block_first_private_subnet
  cidr_block_second_private_subnet = var.cidr_block_second_private_subnet
}

# Importing route table module
module "route_table" {
  source = "./route-table"

  vpc_id                     = module.final_task_vpc.vpc_id
  default_route_table_id     = module.final_task_vpc.vpc_default_route_table_id
  first_public_subnet_id     = module.final_task_vpc.first_public_subnet_id
  second_public_subnet_id    = module.final_task_vpc.second_public_subnet_id
  ec2_instance_nat_id        = module.ec2_instance.ec2_instance_NAT_id
}


output "rds_address" {
  value = module.postgres_db_instance.rds_address
}

output "sns_topic_arn" {
  value = module.final_task_sns_topic.sns_topic_arn
}

output "sqs_queue_url" {
  value = module.final_task_sns_topic.sqs_queue_url
}

output "aws_load_balancer_endpoint" {
  value = module.ec2_instance.aws_load_balancer_endpoint
}