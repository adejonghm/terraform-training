############################################# TERRAFORM #############################################

#In addition to all arguments above, the following attributes are exported:

## id - The ID of the subnet
## arn - The ARN of the subnet.
## ipv6_cidr_block_association_id - The association ID for the IPv6 CIDR block.
## owner_id - The ID of the AWS account that owns the subnet.
## tags_all - A map of tags assigned to the resource, including those inherited from the provider 
### default_tags configuration block.

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

############################################# TERRAFORM #############################################

output "subnet_id" {
  description = "The ID of the subnet"
  value       = aws_subnet.subnets[*].id
}

output "subnet_arn" {
  description = "The ARN of the subnet"
  value       = aws_subnet.subnets[*].arn
}

output "subnet_owner_id" {
  description = "The ID of the AWS account that owns the subnet"
  value       = aws_subnet.subnets[*].owner_id
}