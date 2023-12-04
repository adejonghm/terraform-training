/*
Developed by adejonghm
----------

November 23, 2023
*/


variable "location" {
  type        = string
  default     = "East US 2"
  description = "Azure location that I'm using"
}

variable "account_tier" {
  type        = string
  default     = "Standard"
  description = "The storage account tier"
}

variable "account_replication_type" {
  type        = string
  default     = "LRS"
  description = "The storage account data replication type"
}

variable "rg_name" {
  type        = string
  default     = "TerraformRootRG"
  description = "Resource Group name for Remote State"
}

variable "storage_account_name" {
  type        = string
  default     = "tfstateudemy30183408"
  description = "The name of the AWS S3 Bucket and Azure Storage Account used for Terraform Remote State"
}

variable "storage_container_name" {
  type        = string
  default     = "remote-state"
  description = "The container name within the storage account"
}
