# 
# VARIABLES FILE (INTERNAL ALB + EFS)

variable "region" {
  description = "AWS region"
  type        = string

  validation {
    condition     = can(regex("^[a-z]{2}-[a-z]+-[0-9]$", var.region))
    error_message = "region precisa ser uma região AWS válida."
  }
}

variable "account_id" {
  description = "AWS account ID (12 dígitos)"
  type        = string

  validation {
    condition     = can(regex("^[0-9]{12}$", var.account_id))
    error_message = "account_id precisa ter exatamente 12 dígitos."
  }
}

variable "environment" {
  description = "Nome do ambiente (dev, prd)"
  type        = string

  validation {
    condition     = contains(["dev", "qa", "prd"], var.environment)
    error_message = "environment precisa ser dev, hml, ou prd."
  }
}

variable "vpc_id" {
  description = "ID da VPC existente"
  type        = string

  validation {
    condition     = can(regex("^vpc-[a-f0-9]+$", var.vpc_id))
    error_message = "vpc_id precisa ser um ID de VPC válido."
  }
}

variable "private_subnets" {
  description = "subnets privadas"
  type        = list(string)

  validation {
    condition     = length(var.private_subnets) >= 2
    error_message = "private_subnets precisa ter pelo menos 2 subnets"
  }
}

variable "security_groups" {
  description = "Lista de IDs dos Security Groups a serem associados ao ALB"
  type        = list(string)

  validation {
    condition     = length(var.security_groups) >= 1
    error_message = "security_groups precisa ter pelo menos 1 security group"
  }
}

variable "certificate_arn" {
  description = "ARN do certificado (ACM) utilizado pelo listener HTTPS para SSL/TLS"
  type        = string
}

variable "ssl_policy" {
  description = "SSL/TLS policy applied to the ALB HTTPS listener."
  type        = string
}

# -------------------------- #
# variable "alb_name" {
#   description = "Nome do ALB Interno (aws-<env>-alb-internal-dataeng)"
#   type        = string

#   validation {
#     condition     = can(regex("^[a-zA-Z0-9][a-zA-Z0-9_-]{0,99}$", var.alb_name))
#     error_message = "alb_name precisa começar com alfanumérico e ter no máximo 100 caracteres."
#   }
# }

# variable "profile" {
#   description = "Profile AWS local (SSO). Vazio no CI (usa credenciais do assume-role)."
#   type        = string
# }
