/*
Developed by adejonghm
----------

December 2, 2023
*/

output "instance_ip" {
  value       = aws_instance.udemy_tf.public_ip
  description = "IP of the VM created with Terraform."
}