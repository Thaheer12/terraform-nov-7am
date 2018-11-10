#Creating Public server

resource "aws_instance" "myinstance" {
  count                       = "${var.instances}"
  ami                         = "${lookup(var.ami,var.region)}"
  instance_type               = "${var.instance_type}"
  subnet_id                   = "${element(aws_subnet.subnet1.*.id,count.index)}"
  vpc_security_group_ids      = ["${aws_security_group.wu_sg.id}"]
  key_name                    = "${lookup(var.keyname,var.region)}"
  user_data                   = "${file("userdata.sh")}"
  associate_public_ip_address = true
  depends_on                  = ["aws_security_group.wu_sg"]

  tags {
    Name = "Public_Server-${count.index + 1}"
  }
}

output "Public_Instance_Public_ip" {
  value = ["${aws_instance.myinstance.*.public_ip}"]
}

.xxxxxxx   
