/*
Developed by adejonghm
----------

February 22, 2024
*/


output "subnet_id" {
  value       = aws_subnet.udemy_tf_a.id
  description = "Subnet ID created in the course"
}

output "sec_group_id" {
  value       = aws_security_group.udemy-tf.id
  description = "Security Group ID created in the course"
}
