resource "aws_vpc" "terra-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true #gives you an internal domain name
  enable_dns_hostnames = true #gives you an internal host name
  instance_tenancy     = "default"

  tags = {
    Name = "terra-vpc"
  }
}

resource "aws_subnet" "terra-subnet-public" {
  vpc_id                  = aws_vpc.terra-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true //it makes this a public subnet
  availability_zone       = "us-east-1a"

  tags = {
    Name = "terra-subnet-public"
  }
}