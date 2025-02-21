provider "aws" {
  region     = "us-east-1"
  profile = "DevopsAdmin"
}


terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

