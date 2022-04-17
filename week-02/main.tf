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
  region = "us-west-2"
  access_key = "56473333VLAJPV664ZBSXT7"
  secret_key = "111111111111111"
}

# Configure the ec2 instance
resource "aws_instance" "ec2-server" {
    ami = "ami-0b36cd6786bcfe120"
    instance_type = "t2.micro"
}
