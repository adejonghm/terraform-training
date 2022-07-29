resource "oci_core_vcn" "internal" {
  dns_label      = "internal"
  cidr_block     = "172.16.0.0/20"
  compartment_id = "ocid1.compartment.oc1..aaaaaaaahntpkll3v3kpxcdtprybokgj6wxfqcu7lqygcnv4y6owkkcm6idq"
  display_name   = "My internal VCN"
}

resource "oci_core_subnet" "dev" {
  vcn_id                     = oci_core_vcn.internal.id
  cidr_block                 = "172.16.0.0/24"
  compartment_id             = "ocid1.compartment.oc1..aaaaaaaahntpkll3v3kpxcdtprybokgj6wxfqcu7lqygcnv4y6owkkcm6idq"
  display_name               = "Dev subnet"
  prohibit_public_ip_on_vnic = true
  dns_label                  = "dev"
}
