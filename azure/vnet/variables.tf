/*
Developed by adejonghm
----------

Naming Convention:
  [resource-abbreviation][platform-course][module]
  [rg][udmtf][<module-name>]

Mar 1, 2024
*/

variable "location" {
  type        = string
  default     = "South Central Us"
  description = "Azure Region used in the Terraform training"
}

variable "rg_name" {
  type        = string
  default     = "rgvnet"
  description = "Resource group used to create a Virtual Network"
}

variable "nsg_name" {
  type        = string
  default     = "nsgvnet"
  description = "Network Sec. Group used to create a Virtual Network"
}

variable "vnet_name" {
  type        = string
  default     = "vnetgeneralpurpose"
  description = "Virtual Network created to be used by other Virtual Machines"
}

variable "vnet_address_space" {
  type        = string
  default     = "10.20.0.0/16"
  description = "Address space for the VNet created to be used by other Virtual Machines"
}
variable "subnets" {
  type = map(string)
  default = {
    snetlabsloadbalancing001 = "10.20.1.0/24",
    snetlabsloadbalancing002 = "10.20.2.0/24",
  }
}

# Variables with values set in terraform.tfvars
variable "subscription_id" {
  type        = string
  description = "The Azure subscription ID"
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
