/*
Developed by adejonghm
----------

Naming Convention:
  [resource-abbreviation][platform-course][module]
  [rg][udmtf][<module-name>]

November 23, 2023
*/

variable "location" {
  type        = string
  default     = "East US 2"
  description = "Azure location that I'm using"
}

variable "rg-name" {
  type        = string
  default     = "rgudmtfstates"
  description = "Resource Group name for Remote State"
}

variable "storage-account-name" {
  type        = string
  default     = "studmtfstates"
  description = "The name of the AWS S3 Bucket and Azure Storage Account used for Terraform Remote State"
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

variable "storage-acc-container-name" {
  type        = string
  default     = "remote-state"
  description = "The container name within the storage account"
}
