module "Jenkins" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "jenkins"
  ami = data.aws_ami.DevOps-Practice.id

  instance_type          = "t3.small"
  vpc_security_group_ids = [var.sg_id]
  subnet_id              = var.public_subnet_id
  user_data = file("jenkins.sh")

  tags = {
    Name = "jenkins"
  }
}



module "Jenkins_agent" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "jenkins_agent"
  ami = data.aws_ami.DevOps-Practice.id

  instance_type          = "t3.micro"
  vpc_security_group_ids = [var.sg_id]
  subnet_id              = var.public_subnet_id
  user_data = file("jenkins_agent.sh")

  tags = {
    Name = "jenkins_agent"
  }
}