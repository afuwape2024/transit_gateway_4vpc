backend "s3" {
  bucket         = "theresiaweb.com"
  key            = "4vpc-transit-gateway/terraform.tfstate"
  region         = "us-east-2"
  dynamodb_table = "terraform-state-lock"
  encrypt        = false
}