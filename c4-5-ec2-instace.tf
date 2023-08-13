module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 4.3.0"

  #for_each               = toset(range(var.instance_count))
  name                   = "${local.name}-BastionHost"
  ami                    = data.aws_ami.amazonlinux.id
  instance_type          = var.instance_type
  key_name               = "EKSDemo"
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.public_bastion_sg.security_group_id]
  tags                   = local.common_tags

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y java-1.8.0-openjdk-devel
              sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
              sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
              sudo yum install -y jenkins
              sudo systemctl enable jenkins
              sudo systemctl start jenkins
              curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
              curl -LO https://dl.k8s.io/release/v1.26.0/bin/linux/amd64/kubectl
              curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
              echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
              sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
              EOF

}
/*
resource "aws_instance" "server" {
  for_each = toset(range(var.instance_count))

  ami           = "data.aws_ami.amazonlinux.id"
  instance_type = "t2.micro"

  provisioner "remote-exec" {
    when =  (each.key == "0")
    inline = [
      "sudo yum update -y",
      "sudo yum install -y java-1.8.0-openjdk",
      "wget -O /tmp/jenkins.rpm https://pkg.jenkins.io/redhat-stable/jenkins-2.263-1.1.noarch.rpm",
      "sudo yum install -y /tmp/jenkins.rpm"
    ]
  }

  provisioner "remote-exec" {
    when =  (each.key == "1")
    inline = [
      "sudo yum update -y",
      "sudo yum install -y java-1.8.0-openjdk",
      "wget -O /tmp/tomcat.tar.gz https://downloads.apache.org/tomcat/tomcat-9/v9.0.45/bin/apache-tomcat-9.0.45.tar.gz",
      "sudo tar xzvf /tmp/tomcat.tar.gz -C /usr/local",
      "sudo ln -s /usr/local/apache-tomcat-9.0.45 /usr/local/tomcat",
      "sudo chown -R tomcat:tomcat /usr/local/tomcat",
      "sudo echo 'export CATALINA_HOME=/usr/local/tomcat' >> ~/.bashrc"
    ]
  }
}

*/