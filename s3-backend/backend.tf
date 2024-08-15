terraform {
  backend "s3" {
    bucket = "nikol-test-bucket23"
    key    = "environment/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "terraform-locks"
    encrypt = true
  }
}
