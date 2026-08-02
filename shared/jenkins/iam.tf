resource "aws_iam_role" "jenkins" {

  name = "jenkins-role"

  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Action = "sts:AssumeRole"

        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

      }

    ]

  })

}

resource "aws_iam_role_policy_attachment" "ecr" {

  role       = aws_iam_role.jenkins.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"

}

resource "aws_iam_role_policy_attachment" "lambda" {

  role       = aws_iam_role.jenkins.name
  policy_arn = "arn:aws:iam::aws:policy/AWSLambda_FullAccess"

}

resource "aws_iam_instance_profile" "jenkins" {

  name = "jenkins-profile"

  role = aws_iam_role.jenkins.name

}