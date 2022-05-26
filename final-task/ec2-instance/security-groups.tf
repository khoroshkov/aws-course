# Configure security group for public subtet
resource "aws_security_group" "sg_final_task_public_subnet" {
  name = "sg_final_task_public_subnet"
  vpc_id = var.vpc_id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 443
    to_port = 443
    protocol = "tcp"
  }

  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }

  tags = {
    Name = "pablic subnet security group"
  }
}


# Configure security group for private subtet
resource "aws_security_group" "sg_final_task_private_subnet" {
  name = "sg_final_task_private_subnet"
  vpc_id = var.vpc_id

  ingress {
    cidr_blocks = [var.cidr_block_vpc]
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }

  ingress {
    cidr_blocks = [var.cidr_block_vpc]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }

   ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.cidr_block_vpc]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private subnet security group"
  }
}