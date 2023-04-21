resource "aws_instance" "instancia_rn" {
  ami                    = var.ec2_specs_vr.ami
  instance_type          = var.ec2_specs_vr.type
  subnet_id              = aws_subnet.public_subnet_rn.id
  key_name               = data.aws_key_pair.llave_dt.key_name #HACEMOS USO DE DATA PARA REFERENCIAR LA LLAVE NAME
  vpc_security_group_ids = [aws_security_group.sg_instance_rn.id]
  user_data              = file("script/userdata.sh") #ESPECIFICO EL SCRIP QUE SE VA A EJECUTAR

  tags = {
    "Name" = "Lab6"
  }

  lifecycle {
    create_before_destroy = true
  }
}

#SG PARA INSTANCIA
resource "aws_security_group" "sg_instance_rn" {
  name        = "ssh allow"
  description = "ssh allow inbound traffic"
  vpc_id      = aws_vpc.vpc_virginia_rn.id

  ingress {
    description = "ssh allow trafic"
    from_port   = var.sg_instance_vr[0]
    to_port     = var.sg_instance_vr[0]
    protocol    = "tcp"
    cidr_blocks = [var.sg_instance_vr[1]]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "sg_instance_lab6"
  }
}
