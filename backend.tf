terraform {
  backend "s3" {
    bucket       = "dango-terraform-backend"
    key          = "jenkins-lab/terraform.tfstate"
    region       = "ap-northeast-1"
    encrypt      = true
  }
}