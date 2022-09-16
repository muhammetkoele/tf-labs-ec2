terraform {
  backend "s3" {
    bucket         = "ta-terraform-tfstates-2400-8627-2411"
    key            = "sprint1/week2/tf-labs-ec2/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}
