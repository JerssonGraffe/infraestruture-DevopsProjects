resource "aws_ecr_repository" "python_dummy" {
  name                 = "python-dummy"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}