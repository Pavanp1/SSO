terraform {
  backend "s3" {
#    bucket = "remote-state-backend2601"
    key        = "wpt/organisations/module/sso_account_assignment/terraform.tfstate"
    encrypt    = true
    region     = "us-east-1"
  }
}




