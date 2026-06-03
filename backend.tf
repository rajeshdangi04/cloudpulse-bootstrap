terraform {
  backend "s3" {
    bucket = "cloudpulse-terraform-state"
    key    = "bootstrap/terraform.tfstate"
    region = "ap-south-1"
  }
}
