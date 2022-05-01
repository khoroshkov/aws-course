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
  access_key = "**********"
  secret_key = "**********"
}

# Configure VPS
resource "aws_vpc" "my-test-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc-ec2"
  }
}

# Configure subnet
resource "aws_subnet" "subnet-1" {
  vpc_id            = aws_vpc.my-test-vpc.id
  cidr_block        = aws_vpc.my-test-vpc.cidr_block
  availability_zone = "us-west-2"

  tags = {
    Name = "subnet-ec2-instance"
  }
}

# Configure action template
data "template_file" "download-file" {
  template = "${file("download-file.sh")}"

  vars = {
    s3-bucket             = "test-bucket-mkhoroshkov"
    source-file           = "test.txt"
    destination-file      = "test.txt"
  }
}

# Configure the ec2 instance
resource "aws_instance" "ec2-server" {
    ami = var.ec2_ami_id
    instance_type = var.ec2_instance_type
    key_name = "***********"
    security_groups = [aws_security_group.ingress-ssh-sg.id, 
    aws_security_group.ingress-http-sg.id, 
    aws_security_group.egress-all-sg.id]
    subnet_id = aws_subnet.subnet-1.id
    iam_instance_profile = aws_iam_instance_profile.web_instance_profile.id
    

    user_data = data.template_file.download-file.rendered
}

