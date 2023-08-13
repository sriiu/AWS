module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.5.0"

  name                = "${local.name}-bastionhost"
  vpc_id              = module.vpc.vpc_id
  ingress_rules       = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]


  egress_rules = ["all-all"]
  tags         = local.common_tags

}

resource "aws_security_group" "mysql_allow" {
  name        = "mysql_allow"
  description = "Allow access for RDS Database on Port 3306"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Allow access for RDS Database on Port 3306"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    #cidr_blocks      = var.cidr_block
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_3306"
  }
}