/*
Developed by adejonghm
----------

November 1, 2023
*/

resource "aws_s3_bucket" "aws_bucket-tfstate-files" {
  bucket = "ud30183408-state-files"

  tags = {
    name = "Terraform State Files"
  }
}
