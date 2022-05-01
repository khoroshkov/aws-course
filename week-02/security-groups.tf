# Configure security groups
resource "aws_security_group" "ingress-ssh-sg" {
  name = "allow_ssh_sg"
  vpc_id = aws_vpc.my-test-vpc.id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }
}

resource "aws_security_group" "ingress-http-sg" {
  name = "allow_http_sg"
  vpc_id = aws_vpc.my-test-vpc.id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }
}

resource "aws_security_group" "egress-all-sg" {
  name = "allow_all_sg"
  vpc_id = aws_vpc.my-test-vpc.id
  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}