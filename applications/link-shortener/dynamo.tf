resource "aws_dynamodb_table" "urls" {

  name = "${var.lambda_name}-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "short_code"

  attribute {
    name = "short_code"
    type = "S"
  }
}