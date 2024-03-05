############################################# TERRAFORM #############################################

# Provides a S3 bucket resource
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

############################################# TERRAFORM #############################################

resource "random_integer" "suffix" {
  min = 1
  max = 50000
}

resource "aws_s3_bucket" "buckets" {
  bucket = "my-tf-test-bucket-${random_integer.suffix.result}"

  tags = {
    Environment = "Dev"
  }
}
