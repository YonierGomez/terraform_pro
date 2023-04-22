variable "instance_names" {
  type = list(string)
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance to launch"
  type        = string
}

resource "aws_instance" "instance" {
  count         = length(var.instance_names)
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = var.instance_names[count.index]
  }
}
