resource "aws_instance" "my-ec2" {
  ami = var.ami_id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.main.id #指定したパブリックサブネットに配置
  associate_public_ip_address = true # インターネットに公開するためのパブリック IP を付与
  vpc_security_group_ids = [aws_security_group.allow_tls.id] # 指定したセキュリティグループを適用
  availability_zone = "ap-northeast-1a"
  key_name = "jenkins_test"
  tags = {
    Name = var.ec2_name
  }
}