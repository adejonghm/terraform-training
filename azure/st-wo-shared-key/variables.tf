/*
Developed by adejonghm
----------

Create a storage account without Shared Key Access and SAS Token

December 11, 2024
*/

variable "location" {
  type        = string
  default     = "Brazil South"
  description = "Azure location that I'm using"
}

variable "rg-name" {
  type        = string
  default     = "rglabs"
  description = "Resource Group name for Remote State"
}

variable "storage-account-name" {
  type        = string
  default     = "stlabswosharedkey"
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

variable "st-container-name" {
  type        = string
  default     = "blobwithoutsharedkey"
  description = "The container name within the storage account"
}

variable "access-key-enabled" {
  type        = string
  default     = false
  description = "This variable disables the Shared Key Access from the Storage Account"
}
