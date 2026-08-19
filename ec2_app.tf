resource "aws_instance" "my-ec2-release" {
  ami                         = var.ami_id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.main.id                #指定したパブリックサブネットに配置
  associate_public_ip_address = true                              # インターネットに公開するためのパブリック IP を付与
  vpc_security_group_ids      = [aws_security_group.allow_tls_app.id] # 指定したセキュリティグループを適用
  availability_zone           = "ap-northeast-1a"
  key_name                    = "jenkins_test"

  # Apache + CodeDeploy Agent install
  user_data = <<-EOF
#!/bin/bash
set -eux

# Package update
dnf upgrade -y

# Apache install
dnf install -y httpd

# Apache start
systemctl enable httpd
systemctl start httpd

# Test page
echo "<h1>Hello CodeDeploy App Server</h1>" > /var/www/html/index.html

# CodeDeploy Agent prerequisites
dnf install -y wget

# CodeDeploy Agent install
cd /home/ec2-user

wget https://aws-codedeploy-ap-northeast-1.s3.ap-northeast-1.amazonaws.com/latestv2/install

chmod +x ./install
./install auto

# CodeDeploy Agent start
systemctl enable codedeploy-agent
systemctl start codedeploy-agent
EOF

  tags = {
    Name = var.ec2_name_app
  }
}