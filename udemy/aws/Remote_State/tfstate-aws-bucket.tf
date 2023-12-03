/*
Developed by adejonghm
----------

November 1, 2023
*/

resource "aws_s3_bucket" "tfstate" {
  bucket = var.bucket_name

  tags = {
    name = "Terraform State Files"
  }
}

# Enabling version control in TfState
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.tfstate.id
  versioning_configuration {
    status = "Enabled"
  }
}
