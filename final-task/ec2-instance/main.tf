# data "template_file" "install_java_user_data" {
#   template = "${file("install.sh.tpl")}"
# }

# data "template_file" "install_private_subnet_user_data" {
#   template = "${file("install-private-subnet.sh.tpl")}"

#   vars = {
#     rds_address = var.rds_address
#   }
# }

resource "aws_launch_template" "final_task_launch_template" {
  image_id      = var.ec2_ami_id
  instance_type = var.ec2_instance_type
  key_name      = var.aws_ssh_key_name

  iam_instance_profile {
    name = "${aws_iam_instance_profile.final_task_instance_profile.name}"
  }

  vpc_security_group_ids = [aws_security_group.sg_final_task_public_subnet.id]

  # user_data = "${data.template_file.install_java_user_data.rendered}"
  user_data = base64encode(templatefile("${path.module}/install.sh.tpl", {s3_bucket_name = var.s3_bucket_name}))
}

resource "aws_autoscaling_group" "final_task_ag" {
  max_size = 2
  min_size = 2

  vpc_zone_identifier = [var.public_subnet_first_id, var.public_subnet_second_id]
  target_group_arns   = [aws_lb_target_group.target_group_load_balancer.arn]

  launch_template {
    id      = aws_launch_template.final_task_launch_template.id
    version = "$Latest"
  }
}

resource "aws_instance" "ec2_instance_private_subnet" {
  ami                    = var.ec2_ami_id
  instance_type          = var.ec2_instance_type
  key_name               = var.aws_ssh_key_name
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [aws_security_group.sg_final_task_private_subnet.id]
  iam_instance_profile   = aws_iam_instance_profile.final_task_instance_profile.id

  # user_data = "${data.template_file.install_private_subnet_user_data.rendered}"
  user_data = base64encode(templatefile("${path.module}/install-private-subnet.sh.tpl", {rds_address = var.rds_address}))

  tags = {
    name = "ec2 instance for private subnet"
  }
}

resource "aws_instance" "ec2_instance_NAT" {
  ami                    = var.ec2_nat_ami_id
  # instance_type          = var.ec2_instance_type
  # NOT FREE TIER INSTANCE TYPE
  instance_type          = "c6g.medium"
  subnet_id              = var.public_subnet_first_id
  key_name               = var.aws_ssh_key_name
  source_dest_check      = false
  vpc_security_group_ids = [aws_security_group.sg_final_task_public_subnet.id]

  tags = {
    name = "NAT ec2 instance"
  }
}


output "ec2_instance_NAT_id" {
  value = aws_instance.ec2_instance_NAT.id
}

output "aws_load_balancer_endpoint" {
  value = aws_lb.final_task_app_load_balancer.dns_name
}