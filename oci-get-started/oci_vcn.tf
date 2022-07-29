/*
  Made by Alejandro de Jongh

  Providing a Virtual Cloud Network and subnet in OCI.
  The compartment_id is declared using the .tfvars file
*/

resource "oci_core_vcn" "internal" {
  dns_label      = "internal"
  cidr_block     = "172.16.0.0/20"
  compartment_id = var.compartment_id
  display_name   = "My internal VCN"
}

resource "oci_core_subnet" "dev" {
  vcn_id                     = oci_core_vcn.internal.id
  cidr_block                 = "172.16.0.0/24"
  compartment_id             = var.compartment_id
  display_name               = "Dev subnet"
  prohibit_public_ip_on_vnic = true
  dns_label                  = "dev"
}
