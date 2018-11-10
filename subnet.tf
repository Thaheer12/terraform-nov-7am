# # Create a new load balancer
# resource "aws_elb" "myelb" {
#   name            = "apache_elb"
#   subnets         = ["${aws_subnet.subnet1.*.id}"]
#   security_groups = ["${aws_security_group.wu_sg.*.id}"]
#
#   listener {
#     instance_port     = 80
#     instance_protocol = "http"
#     lb_port           = 80
#     lb_protocol       = "http"
#   }
#
#   health_check {
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#     timeout             = 3
#     target              = "HTTP:80/index.html"
#     interval            = 10
#   }
#
#   instances                   = ["${aws_instance.myinstance.*.id}"]
#   cross_zone_load_balancing   = true
#   idle_timeout                = 400
#   connection_draining         = true
#   connection_draining_timeout = 300
#
#   tags {
#     Name = "my-elb"
#   }
# }
#
# output "ELB_DNS" {
#   value = ["${aws_elb.bar.*.dns_name}"]
# }
#
# resource "aws_launch_configuration" "as_conf" {
#   image_id        = "${lookup(var.ami,var.region)}"
#   instance_type   = "${var.instance_type}"
#   security_groups = ["${aws_security_group.wu_sg.id}"]
#   key_name        = "${lookup(var.keyname,var.region)}"
#   user_data       = "${file("userdata.sh")}"
# }
#
# resource "aws_autoscaling_group" "myapp_ASG" {
#   name     = "myapp_ASG"
#   max_size = 2
#   min_size = 1
#
#   # desired_capacity          = 1
#   health_check_grace_period = 300
#   health_check_type         = "ELB"
#   load_balancers            = ["${aws_elb.bar.name}"]
#   force_delete              = true
#   vpc_zone_identifier       = ["${aws_subnet.subnet1.*.id}"]
#   launch_configuration      = "${aws_launch_configuration.as_conf.name}"
# }
#
# resource "aws_autoscaling_policy" "AddInstancesPolicy" {
#   name                   = "AddInstancesPolicy"
#   scaling_adjustment     = 2
#   adjustment_type        = "ChangeInCapacity"
#   cooldown               = 300
#   autoscaling_group_name = "${aws_autoscaling_group.myapp_ASG.name}"
# }
#
# resource "aws_autoscaling_policy" "RemoveInstancesPolicy" {
#   name                   = "RemoveInstancesPolicy"
#   scaling_adjustment     = -2
#   adjustment_type        = "ChangeInCapacity"
#   cooldown               = 300
#   autoscaling_group_name = "${aws_autoscaling_group.myapp_ASG.name}"
# }
#
# resource "aws_cloudwatch_metric_alarm" "avg_cpu_ge_80" {
#   alarm_name          = "avg_cpu_ge_80"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   evaluation_periods  = "2"
#   metric_name         = "CPUUtilization"
#   namespace           = "AWS/EC2"
#   period              = "120"
#   statistic           = "Average"
#   threshold           = "80"
#
#   dimensions {
#     AutoScalingGroupName = "${aws_autoscaling_group.myapp_ASG.name}"
#   }
#
#   alarm_description = "This metric monitors ec2 cpu utilization"
#   alarm_actions     = ["${aws_autoscaling_policy.AddInstancesPolicy.arn}"]
# }
#
# resource "aws_cloudwatch_metric_alarm" "avg_cpu_le_30" {
#   alarm_name          = "avg_cpu_le_30"
#   comparison_operator = "LessThanOrEqualToThreshold"
#   evaluation_periods  = "2"
#   metric_name         = "CPUUtilization"
#   namespace           = "AWS/EC2"
#   period              = "120"
#   statistic           = "Average"
#   threshold           = "30"
#
#   dimensions {
#     AutoScalingGroupName = "${aws_autoscaling_group.myapp_ASG.name}"
#   }
#
#   alarm_description = "This metric monitors ec2 cpu utilization"
#   alarm_actions     = ["${aws_autoscaling_policy.RemoveInstancesPolicy.arn}"]
# }

