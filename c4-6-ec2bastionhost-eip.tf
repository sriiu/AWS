resource "aws_eip" "ec2ip" {
  depends_on = [module.ec2-instance, module.vpc]
  instance   = module.ec2-instance.id
  vpc        = true
}

