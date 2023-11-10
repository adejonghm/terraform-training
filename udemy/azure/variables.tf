/*
Developed by adejonghm
----------

November 10, 2023
*/

variable "location" {
  type        = string
  default     = "East US"
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