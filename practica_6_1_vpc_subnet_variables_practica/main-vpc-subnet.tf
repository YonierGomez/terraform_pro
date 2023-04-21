resource "aws_vpc" "vpc_virginia_rn" {
  cidr_block = var.virginia_cidr
  # tags       = var.tags_vr
  tags = {
    "Name" = "vpc_virgnia"
  }
}

resource "aws_subnet" "public_subnet_rn" {
  vpc_id                  = aws_vpc.vpc_virginia_rn.id
  cidr_block              = var.subnets_vr[0]
  map_public_ip_on_launch = true
  # tags                    = var.tags_vr
  tags = {
    "Name" = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet_rn" {
  vpc_id     = aws_vpc.vpc_virginia_rn.id
  cidr_block = var.subnets_vr[1]
  # tags       = var.tags_vr
  tags = {
    "Name" = "private_subnet"
  }
}
