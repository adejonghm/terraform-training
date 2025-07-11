/*
Developed by adejonghm
----------

Naming Convention:
  [resource-abbreviation][platform-course][module]
  [rg][udmtf][<module-name>]

Mar 1, 2024
*/

variable "subscription_id" {
  type        = string
  description = "The Azure subscription ID"
}

variable "subnets" {
  type = map(string)
  default = {
    snetlablb001 = "10.20.2.0/24",
    snetlablb002 = "10.20.3.0/24",
  }
}
