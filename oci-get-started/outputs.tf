/*
  Made by Alejandro de Jongh

  Query data with outputs
*/

output "vcn_state" {
  description = "The state of the VCN."
  value       = oci_core_vcn.internal.state
}

output "vcn_dir" {
  description = "CIDR block of the core VCN"
  value       = oci_core_vcn.internal.cidr_block
}

output "subnet_dir" {
  description = "CIDR block of the Dev Subnet"
  value       = oci_core_subnet.dev.cidr_block
}

output "subnet_parent_ID" {
  description = "value"
  value       = oci_core_subnet.dev.vcn_id
}