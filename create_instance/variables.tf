variable "AWS_ACCESS_KEY" {
  default = "your_value"
}
variable "AWS_SECRET_KEY" {
  default = "your_value"
}
variable "AWS_REGION" {
   default = "us_east_1"
}
variable "AMIS" {
    type = "map"
    default = {
        us-east-1 = "ami-13be557e"
    }
  
}
