variable "nombre_instance_vr" {
  description = "Nombre de instancias ec2"
  default     = ["rasp_orange"]
  type        = set(string)
  # type        = list(string)
}

resource "aws_instance" "instancia_rn" {
  # count                  = length(var.nombre_instance_vr) #EN EL COUNT COMO VALUE TENEMOS UNA LONGITUD DE 3 CON SON LOS VALORES DE LA VARRIABLE
  # for_each               = var.nombre_instance_vr
  for_each               = var.nombre_instance_vr
  ami                    = var.ec2_specs_vr.ami
  instance_type          = var.ec2_specs_vr.type
  subnet_id              = aws_subnet.public_subnet_rn.id
  key_name               = data.aws_key_pair.llave_dt.key_name #HACEMOS USO DE DATA PARA REFERENCIAR LA LLAVE NAME
  vpc_security_group_ids = [aws_security_group.sg_instance_rn.id]
  user_data              = file("script/userdata.sh") #ESPECIFICO EL SCRIP QUE SE VA A EJECUTAR

  tags = {
    "Name" = "${each.value}-${local.sufix}" #ACA HACEMOS USO DE cada elemento de la lista (debe ser set o map)
    # "Name" = var.nombre_instance_vr[count.index] #ACA HACEMOS USO DE 
  }

  lifecycle {
    create_before_destroy = true
  }
}

#DESPLIEGA LA INSTANCIA SEGUN EL CONDICIONAL
resource "aws_instance" "instancia_monitoring_rn" {
  count                  = var.instance_monitoring_vr ? 1 : 0 #HAY 2 SIGNO UNO PARA VERDAD Y OTRO PARA FALSO
  ami                    = var.ec2_specs_vr.ami
  instance_type          = var.ec2_specs_vr.type
  subnet_id              = aws_subnet.public_subnet_rn.id
  key_name               = data.aws_key_pair.llave_dt.key_name #HACEMOS USO DE DATA PARA REFERENCIAR LA LLAVE NAME
  vpc_security_group_ids = [aws_security_group.sg_instance_rn.id]
  user_data              = file("script/userdata.sh") #ESPECIFICO EL SCRIP QUE SE VA A EJECUTAR

  tags = {
    "Name" = "monitoring-${local.sufix}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

#SG PARA INSTANCIA
resource "aws_security_group" "sg_instance_rn" {
  name        = "dynamic port allow"
  description = "dynamic port allow inbound traffic"
  vpc_id      = aws_vpc.vpc_virginia_rn.id

  dynamic "ingress" {
    for_each = var.sg_port_dynamic
    content {
      description = "dynamic port allow trafic"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.sg_instance_vr[2]]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "sg_instance_lab6-${local.sufix}"
  }
}
