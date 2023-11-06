variable "aws_access_key" {
  default = "your_value"
}
variable "AWS_SECRET_KEY" {
  default = "your_value"
}
variable "AWS_REGION" {
   default = "us-east-1"
}
variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-844e0bf7"
  }
}
variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
variable "PRIVATE_KEY" {
  default = "Mykey"
}
variable "PUBLIC_KEY" {
   default =   "mykey.pub"
}
