variable "cidr_block" {
  type = string
  default = "10.0.0.0/16"
}

variable "cidr_block_first_public_subnet" {
  type = string
  default = "10.0.1.0/24"
}

variable "cidr_block_second_public_subnet" {
  type = string
  default = "10.0.2.0/24"
}

variable "cidr_block_first_private_subnet" {
  type = string
}

variable "cidr_block_second_private_subnet" {
  type = string
}

variable "az_first_public_subnet" {
  type = string
  default = "us-west-2a"
}

variable "az_second_public_subnet" {
  type = string
  default = "us-west-2b"
}

variable "az_first_private_subnet" {
  type = string
  default = "us-west-2b"
}

variable "az_second_private_subnet" {
  type = string
  default = "us-west-2c"
}