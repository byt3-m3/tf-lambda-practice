locals {
  lambda_zip = "welcome.zip"
}

data "archive_file" "welcome" {
  type        = "zip"
  source_file = "welcome.py"
  output_path = "${local.lambda_zip}"
}


resource "aws_lambda_function" "welcome_1" {
  filename      = "${local.lambda_zip}"
  function_name = "welcome_1"
  role          = "${aws_iam_role.lambda_role_a.arn}"
  handler       = "welcome.hello"



  source_code_hash = filebase64sha256(local.lambda_zip)

  runtime = "python3.7"


}