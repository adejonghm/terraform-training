variable "container_name" {
  description = "Value of the name for the Docker container"
  default = "ExampleNginxContainer"
  type = string
}

variable "external_port" {
  description = "Value of the container port"
  default = 8080
  type = number
}