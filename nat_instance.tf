resource "aws_instance" "nat" {
  count                       = "${var.instances1}"
  ami                         = "${var.nat_ami}"
  instance_type               = "${var.instance_type}"
  subnet_id                   = "${aws_subnet.subnet1.*.id[1]}"
  vpc_security_group_ids      = ["${aws_security_group.wu_sg.id}"]
  key_name                    = "${lookup(var.keyname,var.region)}"
  associate_public_ip_address = true
  source_dest_check           = false
  depends_on                  = ["aws_security_group.wu_sg"]

  tags {
    Name = "NAT_Server-${count.index + 1}"
  }
}

output "Nat_Instance_Public_ip" {
  value = ["${aws_instance.nat.*.public_ip}"]
}
