/*
Developed by adejonghm
----------

Mar 1, 2024
*/

variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}

variable "subnets" {
  description = "A map of subnet names to their corresponding address prefixes for the Virtual Network"
  type        = map(string)
  default = {
    snetukscstgenpurpose02 = "10.88.10.0/24",
  }
}

# variable "nsg_name" {
#   description = "Network Sec. Group used to create a Virtual Network"
#   type        = string
#   default     = "nsglabs"
# }
# 
# variable "nsg_rules" {
#   description = "List of security rules for the NSG"
#   type = list(object({
#     name                       = string
#     priority                   = number
#     direction                  = string
#     access                     = string
#     protocol                   = string
#     source_port_range          = string
#     destination_port_range     = string
#     source_address_prefix      = string
#     destination_address_prefix = string
#   }))
#   default = [
#     # SSH Connection
#     {
#       name                       = "allow_ssh"
#       priority                   = 100
#       direction                  = "Inbound"
#       access                     = "Allow"
#       protocol                   = "Tcp"
#       source_port_range          = "*"
#       destination_port_range     = "22"
#       source_address_prefix      = "*"
#       destination_address_prefix = "*"
#     },
#     # PING
#     {
#       name                       = "allow_icmp"
#       priority                   = 120
#       direction                  = "Inbound"
#       access                     = "Allow"
#       protocol                   = "Icmp"
#       source_port_range          = "*"
#       destination_port_range     = "*"
#       source_address_prefix      = "*"
#       destination_address_prefix = "*"
#     },
#     # HTTP Web
#     {
#       name                       = "allow_http"
#       priority                   = 140
#       direction                  = "Inbound"
#       access                     = "Allow"
#       protocol                   = "Tcp"
#       source_port_range          = "*"
#       destination_port_range     = "80"
#       source_address_prefix      = "*"
#       destination_address_prefix = "*"
#     }
#   ]
# }
