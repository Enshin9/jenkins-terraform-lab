resource "aws_s3_bucket" "s3_test" {
  bucket = "my-jenkins-test-bucket"
  tags = {
    Name        = "jenkins bucket"
  }
}