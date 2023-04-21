resource "random_string" "sufijo_rn" {
  count   = 3
  length  = 8
  special = false
  upper   = false
  numeric = false
}
