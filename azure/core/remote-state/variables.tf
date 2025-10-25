/*
Developed by adejonghm
----------

November 23, 2023
*/


# Variables with values set in terraform.tfvars
variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}

variable "location" {
  description = "Azure location that I'm using"
  type        = string
  default     = "uksouth"
}

variable "rg_name" {
  description = "Name of the Resource Group for Remote State"
  type        = string
  default     = "rgukscstbaseresrcs"
}

variable "st_name" {
  description = "Name of the Azure Storage Account used for Terraform Remote State"
  type        = string
  default     = "stukscstterrfstate"
}

variable "st_tier" {
  description = "The storage account performance"
  type        = string
  default     = "Standard"
}

variable "st_kind" {
  description = "The storage account kind"
  type        = string
  default     = "StorageV2"
}

variable "st_replication_type" {
  description = "The storage account data replication type"
  type        = string
  default     = "LRS"
}

variable "container_name" {
  description = "The container name within the storage account"
  type        = string
  default     = "tfstates"
}

variable "blobs_to_be_public" {
  description = "Whether to allow blobs to be public"
  type        = bool
  default     = false
}

variable "hierarchical_namespace" {
  description = "Whether to enable hierarchical namespace"
  type        = bool
  default     = false
}
