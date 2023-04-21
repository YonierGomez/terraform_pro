locals {
  sufix = "${var.tags_vr.proyecto}-${var.tags_vr.env}" #RECURSO-PROYECTO-EN
}

resource "random_string" "sufijo_rn" {
  length  = 6
  special = false
  upper   = false
  numeric = false
}

locals {
  s3_sufix = "${var.tags_vr.proyecto}-${random_string.sufijo_rn.id}-${var.tags_vr.env}"
}
