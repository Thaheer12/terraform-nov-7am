resource "aws_vpc" "cityvpc" {
  cidr_block = "145.123.0.0/16"

  tags {
    Name = "City_VPC"
  }
}
