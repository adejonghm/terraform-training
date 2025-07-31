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

variable "nsg_name" {
  type        = string
  default     = "nsg-lb-lab"
  description = "Network Sec. Group used to create a Virtual Network"
}

variable "nsg_rules" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default = [
    {
      name                       = "SSH"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "RDP"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
  description = "List of security rules for the NSG"
}

variable "subnets" {
  type = map(string)
  default = {
    snetlablb001 = "10.88.2.0/24",
    snetlablb002 = "10.88.3.0/24",
  }
}
