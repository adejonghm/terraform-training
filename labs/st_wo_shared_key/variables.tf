/*
Developed by adejonghm
----------

Create a storage account without Shared Key Access and SAS Token

December 11, 2024
*/

variable "my-subscription-id" {
  description = "ID of the Subscription that I use"
  type        = string
}

variable "location" {
  description = "Azure location that I'm using"
  type        = string
  default     = "UK South"
}

variable "rg-name" {
  description = "Resource Group name for Remote State"
  type        = string
  default     = "rglabs"
}

variable "storage-account-name" {
  description = "The name of the AWS S3 Bucket and Azure Storage Account used for Terraform Remote State"
  type        = string
  default     = "stlabswosharedkey"
}

variable "account-tier" {
  description = "The storage account tier"
  type        = string
  default     = "Standard"
}

variable "account-replication-type" {
  description = "The storage account data replication type"
  type        = string
  default     = "LRS"
}

variable "st-container-name" {
  description = "The container name within the storage account"
  type        = string
  default     = "blobwithoutsharedkey"
}

variable "access-key-enabled" {
  description = "Disabling the Shared Key Access from the Storage Account"
  type        = string
  default     = false
}

variable "use-azure-ad" {
  description = "Enabling use of Entra ID to connect into the Storage Account"
  type        = string
  default     = true
}
