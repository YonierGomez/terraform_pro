resource "aws_s3_bucket" "bucket_rn" {
  bucket = local.s3_sufix
}
