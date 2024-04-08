# Create launch config
resource "aws_launch_configuration" "ec2_project_lc" {
  name_prefix          = "ec2_project_lc"
  image_id             = "ami-051f8a213df8bc089"
  instance_type        = "t2.micro"
  security_groups      = [aws_security_group.allow_tls.id]

  lifecycle {
    create_before_destroy = true
  }
}

# Creating our Auto Scaling group (asg)
resource "aws_autoscaling_group" "matts-week21-asg" {
  name                 = "ec2_project_asg"

  desired_capacity     = 2
  max_size             = 5
  min_size             = 2
  health_check_type    = "EC2"
  vpc_zone_identifier  = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]

  launch_configuration = aws_launch_configuration.ec2_project_lc.id
}

# Creating our Application Load Balancer target group (lbtg)
resource "aws_lb_target_group" "ec2_project_lbtg" {
  name     = "ec2-project-lbtg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.ec2_project.id
}
