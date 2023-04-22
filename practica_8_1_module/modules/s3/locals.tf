locals {
  sufix = "${var.tags_name_vr.proyecto}-${random_string.sufijo_rn.id}"
}
