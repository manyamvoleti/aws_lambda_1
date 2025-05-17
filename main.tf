
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
       
    }
  }
}

provider "aws" {
  region = "us-east-1"

 

}


resource "aws_vpc" "hcl_vpc" {
  cidr_block = "10.0.0.0/16" 
  tags = {
    Name = "subrahmanyam_vpc"
  }
}

resource "aws_internet_gateway" "hcl_vpc" {
  vpc_id = aws_vpc.hcl_vpc.id
  tags = {
    Name = "my-internet-gateway"
  }
}


resource "aws_route_table" "hcl_vpc" {
  vpc_id = aws_vpc.hcl_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.hcl_vpc.id
  }
  tags = {
    Name = "my-route-table"
  }
}
