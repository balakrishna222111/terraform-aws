provider "aws" {
    region = var.aws_region
}


# Create VPC
resource "aws_vpc"  "tf-vpc" {
cidr_block = var.cidr_block
enable_dns_support = true
enable_dns_hostnames = true
tags = {
    Name = "tf-vpc"
}
}

resource "aws_subnet" "tf-subnet01" {
 
    tags = { 
     Name = "tf-subnet01"
    }

    vpc_id = aws_vpc.tf-vpc.id
    cidr_block = var.cidr_block_subnet01
    availability_zone = data.aws_availability_zones.all.names[0]

}


resource "aws_subnet" "tf-subnet02" {
    tags = {
        Name = "tf-subnet02"
    }

    vpc_id = aws_vpc.tf-vpc.id
    cidr_block = var.cidr_block_subnet02
    availability_zone = data.aws_availability_zones.all.names[1]

}


data "aws_availability_zones" "all" {
  state = "available"
}