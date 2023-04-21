resource "aws_instance" "instancia_rn" {
  ami                    = "ami-02396cdd13e9a1257"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet_rn.id
  key_name               = data.aws_key_pair.llave_dt.key_name #HACEMOS USO DE DATA PARA REFERENCIAR LA LLAVE NAME
  vpc_security_group_ids = [aws_security_group.sg_instance_rn.id]

  tags = {
    "Name" = "Lab6"
  }

  lifecycle {
    create_before_destroy = true
  }

  #EJECUTAR PROVISIONER LOCAL Y REMOTO
  provisioner "local-exec" {
    command = "echo Instancia creada con la ip ${aws_instance.instancia_rn.public_ip} > provisioner_public_ip.txt"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo Instancia creada con la ip ${self.public_ip} > provisioner_public_ip.txt"
  }

  #PROVISIONER REMOTO
  provisioner "remote-exec" {
    inline = [
      "echo 'hola mundo' > ./remoto.txt"
    ]
    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ec2-user"
      private_key = file("/Volumes/respaldo/STUDY/miportafolio/key-ec2/manuelec2.pem")
    }
  }
}

#SG PARA INSTANCIA
resource "aws_security_group" "sg_instance_rn" {
  name        = "ssh allow"
  description = "ssh allow inbound traffic"
  vpc_id      = aws_vpc.vpc_virginia_rn.id

  ingress {
    description = "ssh allow trafic"
    from_port   = var.sg_instance_port_vr
    to_port     = var.sg_instance_port_vr
    protocol    = "tcp"
    cidr_blocks = [var.sg_instance_cidr_vr]
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
