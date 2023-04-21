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
}
