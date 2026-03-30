/*
Developed by adejonghm
----------

July 30, 2024
*/

variable "ssh_public_key" {
  type        = string
  description = "SSH public key. This value is specified in the terraform.tfvars file."
}

variable "env" {
  description = "Environment where all resources are allocated."
  type        = string
  default     = "udy"
}

variable "project" {
  description = "Name of the project"
  type        = string
  default     = "gitlabpipeline"
}
