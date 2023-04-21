resource "local_file" "pruebas1_rn" {
  count           = 3
  filename        = "prueba-${random_string.sufijo_rn[count.index].id}.txt"
  content         = "Pruebas pruebas de terraform pruebas melas 1"
  file_permission = "0770"
}
