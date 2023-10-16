variable "aws_access_key" {
  default = "your_value"
}
variable "aws_secret_key" {
  default = "your_value"
}
variable "aws_region" {
   default = "us_east_1"
}
variable "amis" {
    type = map()
    default = {
        us-east-1 = "ami-13be557e"
    }
  
}