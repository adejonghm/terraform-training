### AWS ###
# Agregar usuario via IAM terraform y después adjuntar las politicas de accesso AdministratorAccess
# Despues de creado, crear las credenciales de acceso en la pestaña credenciales/llaves_acceso

# export AWS_ACCESS_KEY_ID=
# export AWS_SECRET_ACCESS_KEY=

### Azure ###
# Buscar el servicio Entra ID, despues entrar en el menú App Registration. Luego creamos un nuevo registro, una vez creado, copiar los datos.

# export ARM_CLIENT_ID=Application (client) ID
# export ARM_TENANT_ID= Directory (tenant) ID
# export ARM_SUBSCRIPTION_ID=Subscription/Subscription ID
# export ARM_CLIENT_SECRET=Certificates and Secrets (value)

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    } 
  }
}

provider "aws" {
  region = "us-east-1"
}
