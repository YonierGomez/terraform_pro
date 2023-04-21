resource "aws_vpc" "vpc_virginia_rn" {
  cidr_block = var.virginia_cidr

  tags = {
    Name = "vpc_virginia"
    env  = "dev"
  }
}

#CREAMOS UN SEGUNDO PROVIDER CON EL NOMBRE DE VPC_OHIO_RN Y AÑADIMOS UN PROVIDER CON VALUE aws.alias (ohio)
resource "aws_vpc" "vpc_ohio_rn" {
  cidr_block = var.ohio_cidr
  provider   = aws.ohio #AQUI AÑADIMOS EL PROVIDER CON AWS.OHIO

  tags = {
    Name = "vpc_ohio"
    env  = "dev"
  }
}
