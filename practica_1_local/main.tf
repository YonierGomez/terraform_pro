resource "local_file" "pruebas1" {
  filename        = "prueba.txt"
  content         = "Pruebas pruebas de terraform pruebas melas 1"
  file_permission = "0770"
}
