resource "aws_dynamodb_table" "terraform_locks" {
  name         = "${var.project_name}-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  table_class  = "STANDARD"
  stream_enabled = false

  attribute {
    name = "LockID"
    type = "S"
  }

  point_in_time_recovery {
    enabled = false
  }

  server_side_encryption {
    enabled = true
  }

}