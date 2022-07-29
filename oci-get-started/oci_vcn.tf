resource "oci_core_vcn" "internal" {
  dns_label      = "internal"
  cidr_block     = "172.16.0.0/20"
  compartment_id = "ocid1.compartment.oc1..aaaaaaaahntpkll3v3kpxcdtprybokgj6wxfqcu7lqygcnv4y6owkkcm6idq"
  display_name   = "My internal VCN"
}