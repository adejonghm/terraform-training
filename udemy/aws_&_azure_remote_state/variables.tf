/*
Developed by adejonghm
----------

November 23, 2023
*/



#### GENERAL VARIABLES ####
variable "global_name" {
  type        = string
  default     = "tfstateudemy30183408"
  description = "The name of the AWS S3 Bucket and Azure Storage Account used for Terraform Remote State"
}

#### AWS VARIABLES ####
variable "aws_region" {
  type        = string
  default     = "us-west-1"
  description = "AWS Region that I'm using"
}

#### AZURE VARIABLES ####
variable "az_location" {
  type        = string
  default     = "East US"
  description = "Azure location that I'm using"
}

variable "az_account_tier" {
  type        = string
  default     = "Standard"
  description = "The storage account tier"
}

variable "az_account_replication_type" {
  type        = string
  default     = "LRS"
  description = "The storage account data replication type"
}