variable "security_group_rules" {
  type = map(list(string))
  default = {
    "http" = ["0.0.0.0/0"]
    "ssh"  = ["10.0.0.0/16"]
  }
}

resource "aws_security_group" "example" {
  for_each = var.security_group_rules

  name_prefix = "example-sg-"

  dynamic "ingress" {
    for_each = each.value
    content {
      from_port   = 0
      to_port     = 65535
      protocol    = "tcp"
      cidr_blocks = [ingress.value]
    }
  }
}
