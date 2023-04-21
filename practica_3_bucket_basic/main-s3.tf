resource "aws_s3_bucket" "example" {
  bucket = "myyonierbucket-${random_string.sufijo_rn[count.index].id}"
  count  = 3
  tags = {
    Name        = "myyonierbucket"
    Environment = "Dev"
  }
}
