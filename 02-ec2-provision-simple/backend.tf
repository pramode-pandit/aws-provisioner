terraform {
  backend "s3" {
    bucket         = "bootstrap-tf-sol9092-bucket"
    key            = "env/dev/ec2/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
