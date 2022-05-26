variable "vpc_id" {
  type = string
}

variable "public_subnet_first_id" {
  type = string
}

variable "public_subnet_second_id" {
  type = string
}

variable "private_subnet_id" {
  type = string
}

variable "ec2_ami_id" {
  description = "AMI id for EC2 instance"
  type        = string
}

variable "ec2_nat_ami_id" {
  description = "AMI id for EC2 NAT instance"
  type        = string
}


variable "ec2_instance_type" {
  description = "EC2 instance main type"
  type        = string
  default     = "t2.micro"
}

variable "aws_region" {
  description = "AWS default working region"
  type        = string
  default     = "us-west-2"
}

variable "aws_ssh_key_name" {
  description = "EC2 instance default ssh key"
  type        = string
  default     = "mkhoroshkov-lohika-us-west-2"
}

variable "rds_address" {
  type = string
}

variable "cidr_block_vpc" {
  description = "Cidr block for VPC"
  type    = string
}