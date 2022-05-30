# Postgres basic configuration
resource "aws_db_instance" "postgres_db_instance" {
  name                   = var.rds_db_name
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "postgres"
  engine_version         = "13.4"
  instance_class         = "db.t3.micro"
  username               = var.user_name
  password               = var.user_password
  db_subnet_group_name = aws_db_subnet_group.rds_db_subnet_group.id
  vpc_security_group_ids = [aws_security_group.rds_security_group.id]
  skip_final_snapshot    = true
  publicly_accessible    = true
}

resource "aws_security_group" "rds_security_group" {
  name   = "rds_security_group"
  vpc_id = var.final_task_vpc_id
  
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [var.rds_sg_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.rds_sg_cidr_block]
  }
}

resource "aws_db_subnet_group" "rds_db_subnet_group" {
  subnet_ids = [var.final_task_first_private_subnet_id, var.final_task_second_private_subnet_id]
}

output "rds_address" {
  value = aws_db_instance.postgres_db_instance.address
}