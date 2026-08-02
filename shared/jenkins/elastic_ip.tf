resource "aws_eip" "jenkins" {

  instance = aws_instance.jenkins.id

  domain = "vpc"

  tags = {
    Name = "elastic_ip"
  }
}