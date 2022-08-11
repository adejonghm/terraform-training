# Terraform Providers are plugins used to interact and connect with remote systems
# https://registry.terraform.io/providers/hashicorp/aws/latest


terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.5.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
    assume_role {
      role_arn = "arn:aws:iam::392292519055:role/tf-acn-assume-role"
    }
}

/*
Create IAM Role 

With administratorFullAccess policy
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowAllPermissions",
            "Effect": "Allow",
            "NotAction": [
                "lightsail:*",
                "sagemaker:*"
            ],
            "Resource": "*"
        }
    ]
}

Then assign an Inline policy to Assume Role.
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Resource": "arn:aws:iam::838734154092:role/tf-acn-assume-role"
        }
    ]
}


aws_credentials=$(aws sts assume-role --role-arn arn:aws:iam::838734154092:role/tf-acn-assume-role --role-session-name "tf-acn-treinamento-session" --profile tf-acn-treinamento --output json)

export AWS_ACCESS_KEY_ID=$(echo $aws_credentials|jq '.Credentials.AccessKeyId'|tr -d '"')
export AWS_SECRET_ACCESS_KEY=$(echo $aws_credentials|jq '.Credentials.SecretAccessKey'|tr -d '"')
export AWS_SESSION_TOKEN=$(echo $aws_credentials|jq '.Credentials.SessionToken'|tr -d '"')
*/