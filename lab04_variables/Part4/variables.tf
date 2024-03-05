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
  default = ""
}

variable "profile" {
  type = string
  default = ""
}

variable "vpc_cidr_block" {
  type = string
  default = ""
}

variable "counter" {
  type = number
  default = 2
}

variable "environment" {
  type = string
  default = "dev"

  validation {
    condition     = contains(["network", "sec", "shared", "dev", "pre", "pro"], var.environment)
    error_message = "The current support values are network, sec, shared, dev, pre or pro."
  }
}