provider "aws" {
    access_key= lookup(var.aws_access_key)
    secret_key = lookup(var.aws_secret_key)
    region = lookup(var.aws_region)
  
}

resource "aws_instance" "instance1" {
    ami = lookup(var.amis[var.aws_region])
}