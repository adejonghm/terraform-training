/*
Developed by adejonghm
----------

January 24, 2026
*/

### SUBSCRIPTION VARIABLES ###
variable "subscription_id" {
  type        = string
  description = "ID of the Subscription that I use"
}

variable "location" {
  description = "Azure location that I'm using"
  type        = string
  default     = "UK South"
}

### TAGS VARIABLES ###
variable "owner" {
  description = "Owner of the resources for tagging and cost allocation purposes"
  type        = string
  default     = "adejonghm"
}

variable "management" {
  description = "Management tool used to deploy and manage the infrastructure"
  type        = string
  default     = "terraform"
}

variable "environment" {
  description = "Environment where the resources are created"
  type        = string
  default     = "labs"
}

variable "project" {
  description = "Project name for tagging and cost allocation purposes"
  type        = string
  default     = "storage_account_frontend"
}

### RESOURCES VARIABLES ###
variable "rg_name" {
  description = "Name of the Resource Group for the Storage Account"
  type        = string
  default     = "rgukslabfrontend"
}

variable "st_name" {
  description = "Name of the Storage Account"
  type        = string
  default     = "stukslabfrontend01"
}

variable "st_tier" {
  description = "Tier of the Storage Account"
  type        = string
  default     = "Standard"
}

variable "st_kind" {
  description = "Kind of Storage Account (Storage, StorageV2, BlobStorage, etc.)"
  type        = string
  default     = "StorageV2"
}

variable "st_replication_type" {
  description = "Replication type of the Storage Account"
  type        = string
  default     = "LRS"
}

variable "error_filename" {
  description = "Name of the error document (404 page) for static website hosting"
  type        = string
  default     = "404.html"
}

variable "index_filename" {
  description = "Name of the index document (homepage) for static website hosting"
  type        = string
  default     = "index.html"
}

variable "container_name" {
  description = "Name of the storage container"
  type        = string
  default     = "$web"
}

variable "blob_type" {
  description = "Type of blob to be created (Block, Page, or Append)"
  type        = string
  default     = "Block"
}

variable "content_type" {
  description = "MIME type of the blob files (e.g., text/html, application/json)"
  type        = string
  default     = "text/html"
}

variable "file" {
  description = "Map of files to upload to the storage account"
  default = {
    index = {
      name = "index.html"
      path = "./files/index.html"
    }
    error = {
      name = "404.html"
      path = "./files/404.html"
    }
  }
}
