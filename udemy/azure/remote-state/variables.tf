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

variable "account-tier" {
  type        = string
  default     = "Standard"
  description = "The storage account tier"
}

variable "account-replication-type" {
  type        = string
  default     = "LRS"
  description = "The storage account data replication type"
}

variable "rg-name" {
  type        = string
  default     = "RgUdyTfstate"
  description = "Resource Group name for Remote State"
}

variable "storage-account-name" {
  type        = string
  default     = "saudytfstate30183408"
  description = "The name of the AWS S3 Bucket and Azure Storage Account used for Terraform Remote State"
}

variable "storage-acc-container-name" {
  type        = string
  default     = "remote-state"
  description = "The container name within the storage account"
}
