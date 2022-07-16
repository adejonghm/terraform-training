/*
  Made by Alejandro de Jongh

  Query data with outputs
*/

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}

output "instance_state" {
  description = "Type of the EC2 instance"
  value       = aws_instance.app_server.instance_state
}

output "instance_tags" {
  description = "Storage of the EC2 instance"
  value       = aws_instance.app_server.tags
}

output "instance_type" {
  description = "Tyep of the EC2 instance"
  value       = aws_instance.app_server.instance_type
}