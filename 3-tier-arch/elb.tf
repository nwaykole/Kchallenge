resource "aws_lb" "elb-ext" {
  name               = "External-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ELB-sg.id]
  subnets            = [aws_subnet.web-subnet-1.id, aws_subnet.web-subnet-2.id]
}

resource "aws_lb_target_group" "elb-ext" {
  name     = "ALB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my-vpc.id
}

resource "aws_lb_target_group_attachment" "elb-ext1" {
  target_group_arn = aws_lb_target_group.elb-ext.arn
  target_id        = aws_instance.webserver1.id
  port             = 80

  depends_on = [
    aws_instance.webserver1,
  ]
}

resource "aws_lb_target_group_attachment" "elb-ext2" {
  target_group_arn = aws_lb_target_group.elb-ext.arn
  target_id        = aws_instance.webserver2.id
  port             = 80

  depends_on = [
    aws_instance.webserver2,
  ]
}

resource "aws_lb_listener" "elb-ext" {
  load_balancer_arn = aws_lb.elb-ext.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.elb-ext.arn
  }
}

output "lb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.elb-ext.dns_name
}