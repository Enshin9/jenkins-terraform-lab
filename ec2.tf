resource "aws_instance" "my-ec2" {
  ami = data.aws_ami.example.id
  instance_type = "t2.micro"
  subnet_id              = var.subnet_id # 指定したパブリックサブネットに配置
  associate_public_ip_address = true # インターネットに公開するためのパブリック IP を付与
  security_groups        = [var.public_sg_id] # 指定したセキュリティグループを適用
  tags = {
    Name = var.ec2_name
  }
}