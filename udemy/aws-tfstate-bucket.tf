/*
Developed by adejonghm
----------

November 1, 2023
*/

resource "aws_s3_bucket" "bucket-tfstate-files" {
  bucket = "udemy-terraform-state-files"

  tags = {
    name = "Terraform State Files"
  }
}
