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
  default     = "West US 3"
  description = "Azure location that I'm using"
}

variable "rg_name" {
  type        = string
  default     = "rgtfsource"
  description = "Name of the Resource Group for Remote State"
}

variable "st_name" {
  type        = string
  default     = "stremotestatefiles"
  description = "Name of the Azure Storage Account used for Terraform Remote State"
}

variable "st_tier" {
  type        = string
  default     = "Standard"
  description = "The storage account performance"
}

variable "st_kind" {
  type        = string
  default     = "StorageV2"
  description = "The storage account kind"
}

variable "st_replication_type" {
  type        = string
  default     = "LRS"
  description = "The storage account data replication type"
}

variable "container_name" {
  type        = string
  default     = "terraformstates"
  description = "The container name within the storage account"
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

# Variables with values set in terraform.tfvars
variable "subscription_id" {
  type        = string
  description = "The Azure subscription ID"
}
