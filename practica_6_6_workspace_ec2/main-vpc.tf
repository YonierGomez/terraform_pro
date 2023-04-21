resource "aws_vpc" "vpc_virginia_rn" {
  # cidr_block = var.virginia_cidr
  cidr_block = lookup(var.virginia_cidr, terraform.workspace) #USAMOS LA FUN lookup y pide 2 valores

  tags = {
    Name = "vpc_virginia"
  }
}
