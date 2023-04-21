terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.62.0"
    }
  }
  required_version = "~>1.4.0"
}

provider "aws" {
  region = "us-east-1"
}

#ESTE ES EL PROVIDER DE OHIO CON EL ALIAS DE OHIO
provider "aws" {
  region = "us-east-2"
  alias  = "ohio" #ESTE FUE EL ALIAS GENERADO CON EL NOMBRE DE OHIO
}
