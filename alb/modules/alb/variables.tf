# 
# VARIABLES FILE

variable "name" {
  description = "Nome do ALB Interno (aws-<env>-alb-internal-dataeng)"
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9][a-zA-Z0-9_-]{0,99}$", var.name))
    error_message = "name precisa começar com alfanumérico e ter no máximo 100 caracteres."
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
    error_message = "security_groups precisa ter pelo menos 1 Security Group ID"
  }
}

variable "target_port" {
  description = "Porta de backend na qual os destinos registrados aguardam o tráfego encaminhado pelo ALB"
  type        = number
  default     = 443
}

variable "target_protocol" {
  description = "Protocolo utilizado para a comunicação entre o ALB e os destinos registrados"
  type        = string
  default     = "HTTPS"
}

variable "health_check_path" {
  description = "Path HTTP que o ALB utiliza para realizar verificações de integridade nos destinos registrados"
  type        = string
  default     = "/"
}

variable "certificate_arn" {
  description = "ARN do certificado (ACM) utilizado pelo listener HTTPS para SSL/TLS"
  type        = string
}

variable "ssl_policy" {
  description = "SSL/TLS policy applied to the ALB HTTPS listener."
  type        = string
  default     = ""
}
