/*
  Made by Alejandro de Jongh

  Providing an EC2 instance in AWS
*/

resource "aws_instance" "app_server" {
  ami           = "ami-06640050dc3f556bb" #Red-Hat image
  instance_type = "t2.micro"

  tags = {
    "Name"             = var.instance_name,
    "Group"            = "HashiCorpTraining",
    "Operating System" = "GNU/Linux"
  }
}
