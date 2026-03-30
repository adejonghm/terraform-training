/*
Developed by adejonghm
----------

November 23, 2023
*/


variable "bucket_name" {
  type        = string
  default     = "tfstateudemy30183408"
  description = "The name of the AWS S3 Bucket and Azure Storage Account used for Terraform Remote State"
}

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Region that I'm using"
}
