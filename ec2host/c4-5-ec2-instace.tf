module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 4.3.0"

  name = "${local.name}-bastionhost"
  ami = data.aws_ami.amazonlinux.id
  instance_type = "t2.micro"
  key_name = "jtg"
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.security-group.security_group_id]

  tags = local.common_tags

}