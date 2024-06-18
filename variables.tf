variable "project_name" { type = string }

variable "cloud_provider" {
  type = string
  default = "aws"
}

variable "account_id" { type = string }

variable "region" {
  type = string
  default = "us-east-1"
}
