# Configure security groups
resource "aws_security_group" "ingress_ssh_sg" {
  name = "allow_ssh_sg"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }

  tags = {
    Name = "allow_ssh_conection"
  }
}

resource "aws_security_group" "ingress_http_sg" {
  name = "allow_http_sg"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }

  tags = {
    Name = "allow_http_conection"
  }
}

resource "aws_security_group" "egress_all_sg" {
  name = "allow_egress_all_sg"

  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }

 tags = {
    Name = "allow_all_egress_rule"
  }
}