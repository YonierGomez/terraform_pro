provider "aws" {
  region = "us-east-1"
}

#AÑADIMOS ESTO PARA CREAR UN ID Y USARLO EN EL BUCKET
resource "random_string" "sufijo_rn" {
  count   = 3
  length  = 8
  special = false
  upper   = false
  numeric = false
}

module "s3_buckets" {
  source = "./modules/s3"
  bucket_names = [
    "yonier-bucket-${random_string.sufijo_rn.*.id[0]}",
    "yonier-bucket-${random_string.sufijo_rn.*.id[1]}",
    "yonier-bucket-${random_string.sufijo_rn.*.id[2]}"
  ]
}


#El asterisco (*) en el ejemplo que viste antes se utiliza para realizar una expansión de una lista. En este caso, estamos accediendo al atributo "id" de todos los recursos "random_string" creados en el bloque "module" y generando una lista de sus valores. La sintaxis random_string.sufijo_rn.*.id significa "obtener todos los atributos 'id' de los recursos 'random_string' que coincidan con el nombre 'sufijo_rn'". Esto es útil para evitar tener que enumerar cada recurso "random_string" por separado.

#En este caso, no es necesario usar [count.index] porque la expresión random_string.sufijo_rn.*.id retorna una lista con los valores de todas las instancias del recurso random_string definido en el módulo. El operador .* es usado para indicar que se desea aplicar la expresión id a todas las instancias de random_string. De esta forma, se obtiene una lista de valores que luego puede ser usada para construir los nombres de los buckets en el parámetro bucket_names.

#Si se quisiera acceder a un valor específico de la lista, se podría usar la sintaxis [<índice>]. Pero en este caso, al usar la expresión random_string.sufijo_rn.*.id se obtiene una lista con todos los valores necesarios para construir los nombres de los buckets, por lo que no es necesario usar [count.index].
