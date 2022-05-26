variable "final_task_vpc_id" {
  type = string
}

variable "final_task_first_private_subnet_id" {
  type = string
}

variable "final_task_second_private_subnet_id" {
  type = string
}

variable "user_name" {
  description = "Default user name"
  type = string
  default = "rootuser"
}

variable "user_password" {
  description = "Default user password"
  type = string
  default = "rootuser"
}

variable "rds_db_name" {
  description = "Final task	DBName"
  type = string
  default = "EduLohikaTrainingAwsRds"
}