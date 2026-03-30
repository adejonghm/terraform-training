/*
Developed by adejonghm
----------

February 20, 2024
*/


resource "aws_key_pair" "udemy_tf_ssh" {
  key_name   = "udemy_tf_ssh_key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "udemy_tf" {
  # If you use an Ubuntu Image, the default user is ubuntu
  ami                         = var.ami_id
  key_name                    = aws_key_pair.udemy_tf_ssh.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet_id
  instance_type               = var.ec2_type
  associate_public_ip_address = true
  user_data                   = file("./docs/docker.sh")

  vpc_security_group_ids = [
    data.terraform_remote_state.vpc.outputs.sec_group_id
  ]

  tags = {
    Name = "udemy_tf_vm"
  }
}
