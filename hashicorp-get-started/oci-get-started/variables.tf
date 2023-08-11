/*
  Made by Alejandro de Jongh

  Variables definition
*/

variable "compartment_id" {
  description = "OCID from your tenancy page"
  type        = string
}

variable "region" {
  description = "region where you have OCI tenancy"
  default     = "us-sanjose-1"
  type        = string
}
