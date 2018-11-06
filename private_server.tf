resource "aws_instance" "privateinstance" {
  count                  = "${var.instances}"
  ami                    = "${lookup(var.ami,var.region)}"
  instance_type          = "${var.instance_type}"
  subnet_id              = "${element(aws_subnet.subnet2.*.id,count.index)}"
  vpc_security_group_ids = ["${aws_security_group.wu_sg.id}"]
  key_name               = "${lookup(var.keyname,var.region)}"
  depends_on             = ["aws_security_group.wu_sg"]

  tags {
    Name = "Private_Server-${count.index + 1}"
  }
}

output "Private_Instance_Private_ip" {
  value = ["${aws_instance.privateinstance.*.private_ip}"]
}
