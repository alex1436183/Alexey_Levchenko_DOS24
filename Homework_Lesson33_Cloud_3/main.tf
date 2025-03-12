provider "aws" {
  region = "eu-central-1"
}

resource "aws_launch_template" "app" {
  name_prefix            = "app-launch-template-"
  image_id               = "ami-0e9abdc9e7132e7cd"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_avl_security.id]
}

resource "aws_autoscaling_group" "app" {
  desired_capacity = 2
  max_size         = 4
  min_size         = 2
  vpc_zone_identifier = [
    aws_subnet.my_subnet_a.id,
    aws_subnet.my_subnet_b.id
  ]

  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }

  health_check_type         = "EC2"
  health_check_grace_period = 300
  force_delete              = true
  wait_for_capacity_timeout = "0"

  target_group_arns = [aws_lb_target_group.app_tg.arn]

  depends_on = [aws_lb_target_group.app_tg]

  tag {
    key                 = "Name"
    value               = "nginx"
    propagate_at_launch = true
  }

  # Изменено: используем default_cooldown
  default_cooldown = 300
}

resource "aws_autoscaling_policy" "scale_out" {
  name                   = "scale-out-policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 60
  autoscaling_group_name = aws_autoscaling_group.app.name
}

resource "aws_autoscaling_policy" "scale_in" {
  name                   = "scale-in-policy"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 60
  autoscaling_group_name = aws_autoscaling_group.app.name
}

resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "high-cpu-utilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "Alarm when CPU > 70%"
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.app.name
  }
  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.scale_out.arn]
}

resource "aws_cloudwatch_metric_alarm" "low_cpu" {
  alarm_name          = "low-cpu-utilization"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 30
  alarm_description   = "Alarm when CPU < 30%"
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.app.name
  }
  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.scale_in.arn]
}

resource "aws_lb" "app_lb" {
  name               = "app-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.my_avl_security.id]
  subnets = [
    aws_subnet.my_subnet_a.id,
    aws_subnet.my_subnet_b.id
  ]

  enable_deletion_protection       = false
  enable_cross_zone_load_balancing = true

  tags = {
    Name = "app-load-balancer"
  }
}

resource "aws_lb_target_group" "app_tg" {
  name     = "app-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my_vpc.id

  health_check {
    protocol            = "HTTP"
    path                = "/"
    port                = "80"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

  tags = {
    Name = "app-target-group"
  }
}

resource "aws_lb_listener" "app_listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}
