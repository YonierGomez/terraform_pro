resource "aws_s3_bucket" "example" {
  bucket = local.sufix
  tags = {
    Name        = "myyonierbucket"
    Environment = "Dev"
  }
}
