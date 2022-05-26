# Dynamo DB basic configuration
resource "aws_dynamodb_table" "dynamo_db_table_config" {
  name           = "edu-lohika-training-aws-dynamodb"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserName"

  attribute {
    name = "UserName"
    type = "S"
  }

  tags = {
    Name        = "dynamodb-table-users-names"
    Environment = "development"
  }
}