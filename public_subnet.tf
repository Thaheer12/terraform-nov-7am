resource "aws_subnet" "subnet1" {
  count             = "${length(var.subnet_cidr)}"
  vpc_id            = "${aws_vpc.myvpc.id}"
  cidr_block        = "${element(var.subnet_cidr,count.index)}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"

  tags {
    Name = "Public_Subnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.myvpc.id}"

  tags {
    Name = "WU_IGW"
  }
}

resource "aws_default_route_table" "drt" {
  default_route_table_id = "${aws_vpc.myvpc.default_route_table_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags {
    Name = "Default_RT_WU"
  }
}
