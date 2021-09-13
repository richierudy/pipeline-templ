resource "aws_s3_bucket" "k8s-state" {
  bucket        = var.state_bucket_name
  force_destroy = true

  acl = "private"

  versioning {
    enabled = true
  }

  tags = {
    Owner       = var.owner_name
    Environment = var.environment_name
    Project     = var.project_name
  }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = var.state_table_name
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Owner       = var.owner_name
    Environment = var.environment_name
    Project     = var.project_name
  }
}
