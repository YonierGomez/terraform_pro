#AQUI SE DEFINEN LAS VARIABLES SIN CONTENIDO
variable "virginia_cidr" {
  description = "CIDR DE VIRGINIA"
}

# variable "public_subnet_vr" {
#   description = "CIDR Subnet publica"
#   type        = string
# }

# variable "private_subnet_vr" {
#   description = "CIDR Subnet privatea"
#   type        = string
# }

variable "subnets_vr" {
  description = "Lista de subnet public y private"
  type        = list(string)
}

variable "tags_vr" {
  description = "all tags"
  type        = map(string)
}

# variable "sg_instance_port_vr" {
#   description = "Allow port 22"
#   type        = number
# }

# variable "sg_instance_cidr_vr" {
#   description = "CIDR Allow port 22"
#   type        = string
# }


variable "sg_instance_vr" {
  description = "port and cidr sg"
  type        = tuple([number, number, string])
}

variable "sg_port_dynamic" {
  description = "List port for dynamic block"
  type        = list(number)
}

variable "ec2_specs_vr" {
  description = "Ami, type instance"
  type        = map(string)
}


variable "instance_monitoring_vr" {
  description = "Var que decide si"
  type        = bool
}
