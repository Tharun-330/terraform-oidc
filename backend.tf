terraform {
  backend "s3" {
    bucket         = "tf-state-216989138655"
    key            = "terraform/oidc/terraform.tfstate"
    region         = "ap-southeast-2"
  }
}

