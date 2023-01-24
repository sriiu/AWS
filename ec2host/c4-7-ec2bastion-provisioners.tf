resource "null_resource" "copy_ec2_keys" {
  depends_on = [module.ec2-instance]
  connection {
    type = "ssh"
    host = aws_eip.ec2ip.public_ip
    user = "ec2-user"
    password = ""
    private_key = file("/ec2keypair.pem")
    
  }
  provisioner "file" {
    source = "/ec2keypair.pem"
    destination = "/tmp/ec2keypair.pem"
    
  }
   
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/ec2keypair.pem"
    ]
    
  }
}