provider "" {
    region = "${var.region}"
}

terraform {
  backend "s3" {}
}

resource "aws_vpc" "prd-vpc" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags = {
      "Name" = "prd-vcp"
    }
}

resource "aws_subnet" "public-subnet-1" {
    cidr_block = "${var.public_subnet_1_cidr}"
    vpc_id = "${aws_vpc.prd-vpc.id}"
    availability_zone = "us-east-1a"
    tags = {
      "Name" = "public-subnet-1"
    }
}

resource "aws_subnet" "public-subnet-2" {
    cidr_block = "${var.public_subnet_2_cidr}"
    vpc_id = "${aws_vpc.prd-vpc.id}"
    availability_zone = "us-east-1b"
    tags = {
      "Name" = "public-subnet-2"
    }
}

resource "aws_subnet" "public-subnet-3" {
    cidr_block = "${var.public_subnet_2_cidr}"
    vpc_id = "${aws_vpc.prd-vpc.id}"
    availability_zone = "us-east-1c"
    tags = {
      "Name" = "public-subnet-3"
    }
}

resource "aws_subnet" "private-subnet-1" {
    cidr_block = "${var.private_subnet_1_cidr}"
    vpc_id = "${aws_vpc.prd-vpc.id}"
    availability_zone = "us-east-1a"
    tags = {
      "Name" = "private-subnet-1"
    }
}

resource "aws_subnet" "private-subnet-2" {
    cidr_block = "${var.private_subnet_2_cidr}"
    vpc_id = "${aws_vpc.prd-vpc.id}"
    availability_zone = "us-east-1b"
    tags = {
      "Name" = "private-subnet-2"
    }
}

resource "aws_subnet" "private-subnet-3" {
    cidr_block = "${var.private_subnet_3_cidr}"
    vpc_id = "${aws_vpc.prd-vpc.id}"
    availability_zone = "us-east-1c"
    tags = {
      "Name" = "private-subnet-3"
    }
}

resource "aws_route_table" "public-route-table" {
    vpc_id = "${aws_vpc.prd-vpc.id}"
    tags = {
      "Name" = "public-route-table"
    }
}

resource "aws_route_table" "private-route-table" {
    vpc_id = "${aws_vpc.prd-vpc.id}"
    tags = {
      "Name" = "private-route-table"
    }
}

resource "aws_route_table_association" "public-route-table-1-association" {
    route_table_id = "${aws_route_table.public-route-table.id}"
    subnet_id = "${aws_subnet.public-subnet-1.id}"
}

resource "aws_route_table_association" "public-route-table-2-association" {
    route_table_id = "${aws_route_table.public-route-table.id}"
    subnet_id = "${aws_subnet.public-subnet-2.id}"
}

resource "aws_route_table_association" "public-route-table-3-association" {
    route_table_id = "${aws_route_table.public-route-table.id}"
    subnet_id = "${aws_subnet.public-subnet-3.id}"
}

resource "aws_route_table_association" "private-route-table-1-association" {
    route_table_id = "${aws_route_table.private-route-table.id}"
    subnet_id = "${aws_subnet.private-subnet-1.id}"
}

resource "aws_route_table_association" "private-route-table-2-association" {
    route_table_id = "${aws_route_table.private-route-table.id}"
    subnet_id = "${aws_subnet.private-subnet-2.id}"
}

resource "aws_route_table_association" "private-route-table-3-association" {
    route_table_id = "${aws_route_table.private-route-table.id}"
    subnet_id = "${aws_subnet.private-subnet-3.id}"
}

resource "aws_eip" "elastic-ip-for-nat-gtw" {
    vpc = true
    associate_with_private_ip = "10.0.0.5"
    tags = {
      "Name" = "prd-eip"
    }
}