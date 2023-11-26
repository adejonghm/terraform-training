/*
Developed by adejonghm
----------

November 1, 2023
*/

resource "aws_s3_bucket" "tfstate" {
  bucket = var.global_name

  tags = {
    name = "Terraform State Files"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  # Enabling version control in TfState
  bucket = aws_s3_bucket.tfstate.id
  versioning_configuration {
    status = "Enabled"
  }
}