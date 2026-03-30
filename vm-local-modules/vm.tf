/*
Developed by adejonghm
----------

February 22, 2024
*/


resource "aws_key_pair" "udemy_tf_ssh" {
  key_name   = "udemy_tf_ssh_key-${var.environment}"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "udemy_tf" {
  # If you use an Ubuntu Image, the default user is ubuntu
  ami                         = var.ami_id
  key_name                    = aws_key_pair.udemy_tf_ssh.key_name
  subnet_id                   = module.network.subnet_id
  instance_type               = var.ec2_type
  vpc_security_group_ids      = [module.network.sec_group_id]
  associate_public_ip_address = true

  tags = {
    Name = "udemy_tf_vm-${var.environment}"
  }
}
