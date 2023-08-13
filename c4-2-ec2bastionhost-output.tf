output "ec2_Public_instance_id" {
  value = module.ec2-instance.id
}

output "ec2_eip" {
  value = aws_eip.ec2ip.public_ip

}