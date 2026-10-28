# 
# INERNAL ALB + EFS

terraform {
  backend "s3" {
    bucket       = "tfstateudemy30183408"
    key          = "aft/alb/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}
