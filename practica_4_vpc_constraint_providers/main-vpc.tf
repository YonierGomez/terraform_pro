resource "aws_vpc" "vpc_virginia_rn" {
  cidr_block = "10.10.0.0/16"

  tags = {
    Name = "vpc_virginia"
    env  = "dev"
  }
}

#CREAMOS UN SEGUNDO PROVIDER CON EL NOMBRE DE VPC_OHIO_RN Y AÑADIMOS UN PROVIDER CON VALUE aws.alias (ohio)
resource "aws_vpc" "vpc_ohio_rn" {
  cidr_block = "10.20.0.0/16"
  provider   = aws.ohio #AQUI AÑADIMOS EL PROVIDER CON AWS.OHIO

  tags = {
    Name = "vpc_ohio"
    env  = "dev"
  }
}