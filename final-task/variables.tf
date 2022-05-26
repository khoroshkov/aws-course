variable "ec2_ami_id" {
  description = "AMI id for EC2 instance"
  type        = string
  default     = "ami-0b36cd6786bcfe120"
}

variable "ec2_nat_ami_id" {
  description = "AMI id for EC2 NAT instance"
  type        = string
  default     = "ami-0f48d15c9efb5f63d"
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

variable "cidr_block_vpc" {
  description = "Default cidr block for VPC"
  type    = string
  default = "10.0.0.0/16"
}

variable "cidr_block_first_public_subnet" {
  description = "Cidr block for first public subnet"
  type    = string
  default = "10.0.1.0/24"
}

variable "cidr_block_second_public_subnet" {
  description = "Cidr block for second public subnet"
  type = string
  default = "10.0.2.0/24"
}

variable "cidr_block_first_private_subnet" {
  description = "Cidr block for first private subnet"
  type = string
  default = "10.0.3.0/24"
}

variable "cidr_block_second_private_subnet" {
  description = "Cidr block for second private subnet"
  type = string
  default = "10.0.4.0/24"
}