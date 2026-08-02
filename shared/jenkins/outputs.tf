output "jenkins_ip" {

  value = aws_eip.jenkins.public_ip

}

output "jenkins_dns" {

  value = aws_instance.jenkins.public_dns

}