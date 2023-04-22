provider "aws" {
  region = "us-east-1"
}

module "s3_buckets" {
  source       = "./modules/s3"
  bucket_names = ["my-bucket-1neytorprooo", "my-bucket-2-neytorprooo", "my-bucket-3-neytor-proo"]
}
