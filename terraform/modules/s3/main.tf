/*resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket_name

  tags = {
    Name       = "${var.env}-terraform-state"
    Owner      = var.owner
    Discipline = var.discipline
    Purpose    = var.purpose
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = var.lock_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name       = "${var.env}-terraform-locks"
    Owner      = var.owner
    Discipline = var.discipline
    Purpose    = var.purpose
  }
}*/