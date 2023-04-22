module "s3" {
  source = "./modules/s3"

  #ESTAS SON LAS ARGUMENTOS PARA LAS VARIABLES MAPEADAS EN EL MODULO
  tags_name_vr = {
    "proyecto" = "mundoserver"
    "env"      = "dev"
    "iac"      = "terraform"
  }
}

output "mybucket_pro_op" {
  description = "ID BUCKET"
  value       = module.s3.mybucket_op #NO ES NECESARIO ESPECIFICAR EL ID YA QUE LO TIENE EL DEL MODULO
}
