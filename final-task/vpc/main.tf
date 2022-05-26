resource "aws_vpc" "final_task_vpc" {
  cidr_block           = var.cidr_block
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    name = "Final task VPC"
  }
}

resource "aws_subnet" "first_public_subnet" {
  vpc_id                  = aws_vpc.final_task_vpc.id
  cidr_block              = var.cidr_block_first_public_subnet
  availability_zone       = var.az_first_public_subnet
  map_public_ip_on_launch = true

  tags = {
    name = "Final task first public subnet"
  }
}

resource "aws_subnet" "second_public_subnet" {
  vpc_id                  = aws_vpc.final_task_vpc.id
  cidr_block              = var.cidr_block_second_public_subnet
  availability_zone       = var.az_second_public_subnet
  map_public_ip_on_launch = true

  tags = {
    name = "Final task second public subnet"
  }
}

resource "aws_subnet" "first_private_subnet" {
  vpc_id            = aws_vpc.final_task_vpc.id
  cidr_block        = var.cidr_block_first_private_subnet
  availability_zone = var.az_first_private_subnet

  tags = {
    name = "Final task first private subnet"
  }
}

resource "aws_subnet" "second_private_subnet" {
  vpc_id            = aws_vpc.final_task_vpc.id
  cidr_block        = var.cidr_block_second_private_subnet
  availability_zone = var.az_second_private_subnet

  tags = {
    name = "Final task second private subnet"
  }
}

output "vpc_id" {
  value = aws_vpc.final_task_vpc.id
}

output "vpc_default_route_table_id" {
  value = aws_vpc.final_task_vpc.default_route_table_id
}

output "first_public_subnet_id" {
  value = aws_subnet.first_public_subnet.id
}

output "second_public_subnet_id" {
  value = aws_subnet.second_public_subnet.id
}

output "first_private_subnet_id" {
  value = aws_subnet.first_private_subnet.id
}

output "second_private_subnet_id" {
  value = aws_subnet.second_private_subnet.id
}
