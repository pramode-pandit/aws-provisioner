# -----------------------------
# S3 Bucket for Terraform State
# -----------------------------
resource "aws_s3_bucket" "tf_state" {
  bucket = var.bucket_name

  tags = {
    Name = "Terraform State Bucket"
  }
}

# Block public access
resource "aws_s3_bucket_public_access_block" "tf_state_block" {
  bucket = aws_s3_bucket.tf_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Enable versioning to preserve history of state files
resource "aws_s3_bucket_versioning" "tf_state_versioning" {
  bucket = aws_s3_bucket.tf_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# -----------------------------
# DynamoDB Table for State Locking
# -----------------------------
resource "aws_dynamodb_table" "tf_lock_table" {
  name           = var.dynamodb_table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "Terraform State Lock Table"
  }
}
