
# Load balancer configuration
resource "aws_lb_target_group" "target_group_load_balancer" {
    name        = "main-load-balancer-target-group"
    port        = 80
    protocol    = "HTTP"
    target_type = "instance"
    vpc_id      = var.vpc_id

  health_check {
    port = 80
    path = "/health"
  }
}

resource "aws_lb_listener" "load_balancer_listener" {
  load_balancer_arn = aws_lb.final_task_app_load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group_load_balancer.arn
  }
}

resource "aws_lb" "final_task_app_load_balancer" {
  name               = "final-task-load-balancer"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg_final_task_public_subnet.id]
  subnets = [var.public_subnet_first_id, var.public_subnet_second_id]
}