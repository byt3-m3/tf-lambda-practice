resource "aws_iam_role_policy" "lambda_role_a_policy" {
  name = "test_policy"
  role = aws_iam_role.lambda_role_a.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = "${file("iam/lambda_policy.json")}"
}

resource "aws_iam_role" "lambda_role_a" {
  name = "lambda_role_a"

  assume_role_policy = "${file("iam/lambda_assume_policy.json")}"
}

