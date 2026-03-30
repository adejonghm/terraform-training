/*
Developed by adejonghm
----------

February 20, 2024
*/


output "instance_ip" {
  value       = aws_instance.udemy_tf.public_ip
  description = "IP of the VM created with Terraform."
}
