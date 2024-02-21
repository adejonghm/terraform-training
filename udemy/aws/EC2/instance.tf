/*
Developed by adejonghm
----------

December 2, 2023
*/

resource "aws_key_pair" "udemy_tf_ssh" {
  key_name   = "udemy_tf_ssh_key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "udemy_tf" {
  ami                         = var.ami_id
  key_name                    = aws_key_pair.udemy_tf_ssh.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet_id
  instance_type               = var.ec2_type
  associate_public_ip_address = true

  vpc_security_group_ids = [
    data.terraform_remote_state.vpc.outputs.sec_group_id
  ]

  tags = {
    Name = "udemy_tf_vm"
  }
}
