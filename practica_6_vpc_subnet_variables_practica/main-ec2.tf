resource "aws_instance" "instancia_rn" {
  ami           = "ami-02396cdd13e9a1257"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet_rn.id
  key_name      = data.aws_key_pair.llave_dt.key_name #HACEMOS USO DE DATA PARA REFERENCIAR LA LLAVE NAME

  tags = {
    "Name" = "Lab6"
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      ami,
      key_name
    ]
  }
}
