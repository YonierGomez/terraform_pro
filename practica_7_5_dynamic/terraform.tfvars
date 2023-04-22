#AQUI SE DEFINEN LOS VALORES DE LAS VARIABLES
virginia_cidr = "10.10.0.0/16"

#SUBNET
# public_subnet_vr  = "10.10.0.0/24"
# private_subnet_vr = "10.10.1.0/24"
subnets_vr = ["10.10.0.0/24", "10.10.1.0/24"]

#ALL TAGS
tags_vr = {
  "env"         = "dev"
  "owner"       = "yonier"
  "iac"         = "terraform"
  "iac_version" = "1.4.5"
  "proyecto"    = "neytor-tf-name"
  "region"      = "virginia"
}

# SG
sg_instance_vr  = [22, 80, "0.0.0.0/0"]
sg_port_dynamic = [22, 80]

#INSTANCIA
ec2_specs_vr = {
  "ami"  = "ami-02396cdd13e9a1257"
  "type" = "t2.micro"
}

#DESPLIEGA O NO LA INSTANCIA DE MONITOREO
instance_monitoring_vr = false
