# Create an IAM role for the Web Servers.
resource "aws_iam_role" "ec2_iam_role" {
    name = "ec2_iam_role"
    assume_role_policy = <<EOF
    {
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
  }
 EOF
}

resource "aws_iam_instance_profile" "dynamodb_instance_profile" {
    name = "dynamodb_instance_profile"
    roles = ["ec2_iam_role"]
}

resource "aws_iam_role_policy" "dynamodb_iam_role_policy" {
  name = "dynamodb_iam_role_policy"
  role = aws_iam_role.ec2_iam_role.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "dynamoDb:*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}