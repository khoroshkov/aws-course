variable "ec2_ami_id" {
  description = "AMI id for EC2 instance"
  type        = string
  default     = "ami-0b36cd6786bcfe120"
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