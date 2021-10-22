provider "aws" {
    region = "us-east-1"
    access_key = "AKIASM5PAJQ3UKK4YDOX"
    secret_key = "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"
}

resource "aws_vpc" "dev-vpc" { # resource is a function that CREATES something
    cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "dev-subnet-1" {
    vpc_id = aws_vpc.dev-vpc.id
    cidr_block = "10.0.10.0/24"
    availability_zone = "us-east-1a"
}

data "aws_vpc" "existing_vpc" { # data is a function that USES something that already exists
    default = true
}

resource "aws_subnet" "dev-subnet-2" {
    vpc_id = data.aws_vpc.existing_vpc.id
    cidr_block = "172.31.48.0/20"
    availability_zone = "us-east-1a"
}