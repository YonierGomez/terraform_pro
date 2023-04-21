#DESCOMENTAR EL ATRIBUTO SI DESEA PRACTICAR
resource "aws_instance" "ec2_importada_rn" {

}

#RECURSO IMPORTADO, SE TRAEN LOS ATRIBUTOS ADECUADOS, DESCOMENTAR SI DESEA LANZAR
# resource "aws_instance" "ec2_importada_rn" {
#   ami                         = "ami-02396cdd13e9a1257"
#   associate_public_ip_address = true
#   availability_zone           = "us-east-1c"
#   cpu_core_count              = 1
#   cpu_threads_per_core        = 1
#   instance_type               = "t2.micro"
#   key_name                    = "manuelec2"
#   security_groups = [
#     "Website",
#   ]
#   subnet_id = "subnet-019a46879397839c9"
#   tags = {
#     "Name" = "pruebas-importada"
#   }
#   vpc_security_group_ids = [
#     "sg-07121b7b6fe112c83",
#   ]

#   root_block_device {
#     delete_on_termination = true
#     encrypted             = false
#     iops                  = 3000
#     tags                  = {}
#     throughput            = 125
#     volume_size           = 8
#     volume_type           = "gp3"
#   }
# }



# IMPORTAR RECURSO
# terraform import aws_instance.ec2_importada_rn  i-0a56e91595ddbd169
