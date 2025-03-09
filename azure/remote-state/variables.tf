/*
Developed by adejonghm
----------

Naming Convention:
  [resource-abbreviation][platform-course][module]
  [rg][udmtf][<module-name>]

November 23, 2023
*/

variable "subscription_id" {
  type        = string
  description = "The Azure subscription ID"
}

variable "location" {
  type        = string
  default     = "Brazil South"
  description = "Azure location that I'm using"
}

variable "rg_name" {
  type        = string
  default     = "rgterraformstates"
  description = "Name of the Resource Group for Remote State"
}

variable "storage_account_name" {
  type        = string
  default     = "stazureremotetfstates"
  description = "Name of the Azure Storage Account used for Terraform Remote State"
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

variable "storage_container_name" {
  type        = string
  default     = "blobremotestates"
  description = "The container name within the storage account"
}

variable "network_access_enabled" {
  type        = bool
  default     = false
  description = "Whether to enable network access to the storage account"
}

variable "blobs_to_be_public" {
  type        = bool
  default     = false
  description = "Whether to allow blobs to be public"
}

variable "hierarchical_namespace" {
  type        = bool
  default     = false
  description = "Whether to enable hierarchical namespace"
}
