terraform {
  backend "s3" {
    bucket         = "datnguyen-s3-backend-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "datnguyen-state-lock"
  }
}

