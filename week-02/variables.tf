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