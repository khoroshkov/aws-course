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
  access_key = "**********"
  secret_key = "**********"
}

# Create sns topic
resource "aws_sns_topic" "first_test_sns" {
  name = "first-test-sns"
}

# Create sqs
resource "aws_sqs_queue" "first_test_sqs" {
  name = "my-aws-testing-queue"
}

# Create and configure the ec2 instance with sns ans sqs
resource "aws_instance" "ec2_sns_sqs_instance" {
    ami = var.ec2_ami_id
    instance_type = var.ec2_instance_type
    key_name = var.aws_ssh_key_name
    security_groups = [aws_security_group.ingress_ssh_sg.name, 
    aws_security_group.ingress_http_sg.name,
    aws_security_group.egress_all_sg.name]

    iam_instance_profile = aws_iam_instance_profile.sns_instance_profile.name
}



output "public_ip" {
  value = aws_instance.ec2_sns_sqs_instance.public_ip
}

output "sns_aws_arn" {
  description = "Amazon Resource Name (ARN) of AWS SNS"
  value       = aws_sns_topic.first_test_sns.arn
}

output "sqs_aws_url" {
  description = "Queue URL of AWS SQS"
  value       = aws_sqs_queue.first_test_sqs.id
}
