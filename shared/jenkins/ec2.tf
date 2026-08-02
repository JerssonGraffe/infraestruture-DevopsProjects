data "aws_ami" "ubuntu" {

  most_recent = true

  owners = ["099720109477"]

  filter {

    name = "name"

    values = [
      "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"
    ]

  }

}

resource "aws_instance" "jenkins" {

  ami = data.aws_ami.ubuntu.id

  key_name = var.key_name

  instance_type = "t3.micro"

  subnet_id = data.terraform_remote_state.network.outputs.public_subnet_id

  vpc_security_group_ids = [
    aws_security_group.jenkins.id
  ]

  iam_instance_profile = aws_iam_instance_profile.jenkins.name

  associate_public_ip_address = true

  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = "ec2-jenkins"
  }

}