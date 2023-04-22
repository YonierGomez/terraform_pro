provider "aws" {
  region = "us-east-1"
}

variable "instance_names" {
  type    = list(string)
  default = ["web-1", "web-2", "app-1", "app-2"]
}

resource "aws_instance" "ec2" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  dynamic "tag" {
    for_each = toset(var.instance_names)
    content {
      tags = {
        Name = tagxx.value
      }
    }
  }
}
