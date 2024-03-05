############################################# TERRAFORM #############################################

# Variáveis primitivas:
## String: sequência de caracteres representando algum texto
## Number: um valor numérico, podendo ser representado por inteiro ou fracionado
## Bool: valor condicional lógico (true ou false)
## Null: valor vazio representado por null sem aspas


# Coleções de Variáveis:
## List/Turple: representado por valores entre colchetes ‘[ ]’ separados por vírgula
## Map: representado por um par de chave/valor entre chaves ‘{ }’

# https://www.terraform.io/language/values/variables

############################################# TERRAFORM #############################################

variable "region" {
  type = string
  default = "us-east-1"
}

variable "profile" {
  type = string
  default = "tf-acn-treinamento"
}

variable "vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
}