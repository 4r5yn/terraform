provider "aws" {
    access_key= lookup(var.AWS_ACCESS_KEY)
    secret_key = lookup(var.AWS_SECRET_KEY)
    region = lookup(var.AWS_REGION)
  
}

resource "aws_instance" "instance1" {
    ami = lookup(var.AMIS[var.AWS_REGION])
}
