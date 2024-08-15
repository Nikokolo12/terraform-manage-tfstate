provider "aws" {
  region = "us-east-1"
}

data "terraform_remote_state" "bucket" {
  backend = "s3"
  config = {
    bucket = "nikol-test-bucket23"
    key    = "environment/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_s3_object" "upload_file" {
  bucket = data.terraform_remote_state.bucket.outputs.bucket_name
  key    = "cat.jpg"
  source = "./files/cat.jpg"
}
