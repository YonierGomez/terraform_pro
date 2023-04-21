#CREA LA VPC
resource "aws_vpc" "vpc_virginia_rn" {
  cidr_block = var.virginia_cidr
  # tags       = var.tags_vr
  tags = {
    "Name" = "vpc_virgnia"
  }
}

#CREA SUBNET PUBLIC
resource "aws_subnet" "public_subnet_rn" {
  vpc_id                  = aws_vpc.vpc_virginia_rn.id
  cidr_block              = var.subnets_vr[0]
  map_public_ip_on_launch = true
  # tags                    = var.tags_vr
  tags = {
    "Name" = "public_subnet"
  }
}

#CREA SUBNET PRIVADA
resource "aws_subnet" "private_subnet_rn" {
  vpc_id     = aws_vpc.vpc_virginia_rn.id
  cidr_block = var.subnets_vr[1]
  # tags       = var.tags_vr
  tags = {
    "Name" = "private_subnet"
  }
}

#INTERNET GATEWAY
resource "aws_internet_gateway" "igw_rn" {
  vpc_id = aws_vpc.vpc_virginia_rn.id
  tags = {
    "Name" = "igw_vpc_virginia"
  }
}

#CREA ROUTE TABLE
resource "aws_route_table" "crt_subnet_public_rn" {
  vpc_id = aws_vpc.vpc_virginia_rn.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_rn.id
  }

  tags = {
    Name = "crt_subnet_public"
  }
}

#ASOCIACION CRT
resource "aws_route_table_association" "crta_subnet_public_rf" {
  subnet_id      = aws_subnet.public_subnet_rn.id
  route_table_id = aws_route_table.crt_subnet_public_rn.id
}