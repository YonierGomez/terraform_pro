variable "bucket_names" {
  type    = list(string)
  default = []
}

resource "aws_s3_bucket" "s3_bucket" {
  count  = length(var.bucket_names)
  bucket = var.bucket_names[count.index]
}
