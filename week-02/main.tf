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
  access_key = "AKIAWVLAJPV664ZBSXT7"
  secret_key = "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"
}

# Configure the ec2 instance
resource "aws_instance" "ec2-server" {
    ami = "ami-0b36cd6786bcfe120"
    instance_type = "t2.micro"
}
