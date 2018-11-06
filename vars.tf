variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "154.132.0.0/16"
}

variable "nat_ami" {
  default = "ami-01623d7b"
}

variable "subnet_cidr" {
  type    = "list"
  default = ["154.132.1.0/25", "154.132.2.0/25"]
}

variable "subnet_cidr1" {
  type    = "list"
  default = ["154.132.3.0/25", "154.132.4.0/25"]
}

data "aws_availability_zones" "available" {}

# variable "azs" {
#   type    = "list"
#   default = ["us-east-1a", "us-east-1b", "us-east-1c"]
# }

variable "vpc_name" {
  default = "WU_vpc"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami" {
  type = "map"

  default = {
    ap-south-1 = "ami-5a8da735"
    us-west-2  = "ami-28e07e50"
    us-east-1  = "ami-0ff8a91507f77f867"
  }
}

variable "instances" {
  default = "1"
}

variable "instances1" {
  default = "1"
}

variable "keyname" {
  type = "map"

  default = {
    ap-south-1 = "mumbaikey"
    us-west-2  = "mykey"
    us-east-1  = "nvergenia"
  }
}
