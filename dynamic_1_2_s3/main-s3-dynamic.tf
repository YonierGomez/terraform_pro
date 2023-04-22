variable "bucket_names" {
  type    = list(string)
  default = ["my-bucket-1nanitoo", "my-bucket-2nanitoo", "my-bucket-3nanitoo"]
}

resource "aws_s3_bucket" "example" {
  dynamic "bucket" {
    for_each = var.bucket_names
    content {
      bucket = bucket.value
      acl    = "private"
      tags = {
        Name = bucket.value
      }
    }
  }
}
