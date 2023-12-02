/*
Developed by adejonghm
----------

December 2, 2023
*/

resource "aws_key_pair" "udemy_tf_ssh" {
  key_name   = "udemy_tf_ssh_key"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_instance" "udemy_tf" {
  ami                         = "ami-0cbd40f694b804622"
  key_name                    = aws_key_pair.udemy_tf_ssh.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet_id
  instance_type               = "t2.micro"
  associate_public_ip_address = true

  vpc_security_group_ids = [
    data.terraform_remote_state.vpc.outputs.sec_group_id
  ]

  tags = {
    Name = "udemy_tf_vm"
  }
}
