resource "aws_internet_gateway" "final_task_internet_gateway" {
  vpc_id = var.vpc_id

  tags = {
    Name = "Final task internet gateway"
  }
}

resource "aws_default_route_table" "final_task_default_route_table" {
  default_route_table_id = var.default_route_table_id

  route {
    cidr_block  = var.route_table_cidr_block
    instance_id = var.ec2_instance_nat_id
  }

  tags = {
    Name = "Final task default route table"
  }
}

resource "aws_route_table" "final_task_public_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.route_table_cidr_block
    gateway_id = aws_internet_gateway.final_task_internet_gateway.id
  }
}

resource "aws_route_table_association" "first_public_subnet_route_table_association" {
  subnet_id      = var.first_public_subnet_id
  route_table_id = aws_route_table.final_task_public_route_table.id
}

resource "aws_route_table_association" "second_public_subnet_route_table_association" {
  subnet_id      = var.second_public_subnet_id
  route_table_id = aws_route_table.final_task_public_route_table.id
}