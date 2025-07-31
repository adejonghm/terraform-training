/*
Developed by adejonghm
----------

July 17, 2025
*/


variable "environment" {
  description = "Environment of the resource (e.g., dev, staging, prod)"
  type        = string
}

variable "owner" {
  description = "Person or team responsible for the resource"
  type        = string
}

variable "managed_by" {
  description = "Specifies the management method used to provision the resource (e.g., Terraform, Bicep, Azure Portal, ARM Template)"
  type        = string
}

variable "additional_tags" {
  description = "Additional resource-specific tags"
  type        = map(string)
  default     = {}
}
