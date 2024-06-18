terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.55.0"
    }
  }

  # TODO: Comment this backend the first time you run the module
  backend "s3" {
    # TODO: Change the bucket name to the desired name
    bucket = "cdanmontoya-terraform-template-state"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-1"

    # TODO: Change the table name to the desired name
    dynamodb_table = "cdanmontoya-terraform-template-locks"
    encrypt        = true
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

module "state" {
  source = "./modules/state"

  project_name = var.project_name
  cloud_provider = var.cloud_provider
}