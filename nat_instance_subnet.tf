# resource "aws_subnet" "subnet2" {
#   count             = "${length(var.subnet_cidr1)}"
#   vpc_id            = "${aws_vpc.myvpc.id}"
#   cidr_block        = "${element(var.subnet_cidr1,count.index)}"
#   availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
#
#   tags {
#     Name = "Private_Subnet-${count.index + 1}"
#   }
# }
#
# resource "aws_route_table" "custom_rt" {
#   vpc_id = "${aws_vpc.myvpc.id}"
#
#   route {
#     cidr_block  = "0.0.0.0/0"
#     instance_id = "${aws_instance.nat.*.id[0]}"
#   }
#
#   tags {
#     Name = "Custom_RT"
#   }
# }
#
# resource "aws_route_table_association" "a" {
#   count          = "${length(var.subnet_cidr1)}"
#   subnet_id      = "${aws_subnet.subnet2.*.id[count.index]}"
#   route_table_id = "${aws_route_table.custom_rt.id}"
# }

