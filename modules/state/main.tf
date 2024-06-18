module "aws_state" {
  source = "./aws"
  count  = var.cloud_provider == "aws" ? 1 : 0

  project_name = var.project_name
}