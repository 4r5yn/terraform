resource "aws_key_pair" "mykey" {
    public_key = file(var.PUBLIC_KEY)
}

resource "aws_instance" "keypair-instance" {
    
    ami = var.AMIS[var.AWS_REGION]
    instance_type = "t2.micro"
    key_name = aws_key_pair.mykey
  
 
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline =[
        "chmod +x /tmp/script.sh",
        "sudo sed -i -e 's/\r$//' /tmp/script.sh",
        "sudo /tmp/script.sh",  
    ]
  }
  connection {
  host = coalesce(self.public_ip, self.private_ip)
  type = "ssh"
  user = var.INSTANCE_USERNAME
  private_key = file(var.PRIVATE_KEY)
  }
}