variable "vpc_id" {
  type = string
}

variable "default_route_table_id" {
  type = string
}

variable "route_table_cidr_block" {
description = "Default cidr block for route table"
  type = string
  default = "0.0.0.0/0"
}

variable "ec2_instance_nat_id" {
  type = string
}

variable "first_public_subnet_id" {
  type = string
}

variable "second_public_subnet_id" {
  type = string
}