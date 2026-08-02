resource "aws_lambda_function" "lambda" {

  function_name = var.lambda_name
  package_type = "Image"
  image_uri = "942752162036.dkr.ecr.us-east-1.amazonaws.com/python-dummy:latest"
  role = aws_iam_role.lambda_role.arn
  timeout = 30
  memory_size = 256

  architectures = [
    "x86_64"
  ]

  lifecycle {
    ignore_changes = [
      image_uri
    ]
  }
}