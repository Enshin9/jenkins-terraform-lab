resource "aws_s3_bucket" "s3_test" {
  bucket = "my-jenkins-test-bucket0529"
  tags = {
    Name = "jenkins bucket"
  }
}