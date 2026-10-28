# 
# 

#--- INTERNAL ALB -----------------#
module "ialb" {
  source = "./modules/alb"

  name            = "aws-${var.environment}-alb-internal-dataeng"
  vpc_id          = var.vpc_id
  certificate_arn = var.certificate_arn
  ssl_policy      = var.ssl_policy
  security_groups = var.security_groups
  private_subnets = var.private_subnets
}

#--- EFS --------------------------#
