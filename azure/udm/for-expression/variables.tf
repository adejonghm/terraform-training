/*
Developed by adejonghm
----------

Naming Convention:
  [resource-abbreviation][platform-course][module]
  [rg][udmtf][<module-name>]

may 12, 2024
*/

variable "my-subscription-id" {
  type        = string
  description = "ID of the Subscription that I use"
}

variable "location" {
  type = map(string)
  default = {
    "br" = "Brazil South"
    "eu" = "West Europe"
    "us" = "East US 2"
  }
  description = "Azure location that I'm using in this course"
}

variable "account_tier" {
  type        = string
  default     = "Standard"
  description = "The defaul Tier that I'm using in this course"
}

variable "account_replication_type" {
  type        = string
  default     = "LRS"
  description = "The default replication type for Storage Account that I'm using in this course"
}
