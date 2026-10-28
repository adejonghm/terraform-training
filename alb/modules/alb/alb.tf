# 
# INTERNAL ALB

resource "aws_lb" "dados" {
  name               = var.name
  load_balancer_type = "application"

  internal        = true
  security_groups = var.security_groups
  subnets         = var.private_subnets

  enable_deletion_protection = false
}

#--- TARGET GROUP -----------------#
resource "aws_lb_target_group" "dados" {
  name     = "${var.name}-tg"
  port     = var.target_port
  protocol = var.target_protocol
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    path                = var.health_check_path
    healthy_threshold   = 3
    unhealthy_threshold = 3
    interval            = 30
    timeout             = 5
    matcher             = "200"
  }

  depends_on = [
    aws_lb.dados
  ]
}

#--- HTTPS LISTENER (443) ---------#
resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.dados.arn

  port     = 443
  protocol = "HTTPS"

  ssl_policy      = var.ssl_policy
  certificate_arn = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.dados.arn
  }

  depends_on = [
    aws_lb.dados,
    aws_lb_target_group.dados
  ]
}
