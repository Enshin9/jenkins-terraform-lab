resource "aws_instance" "my-ec2" {
  ami                         = var.ami_id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.main.id                #指定したパブリックサブネットに配置
  associate_public_ip_address = true                              # インターネットに公開するためのパブリック IP を付与
  vpc_security_group_ids      = [aws_security_group.allow_tls.id] # 指定したセキュリティグループを適用
  availability_zone           = "ap-northeast-1a"
  key_name                    = "jenkins_test"
  # Jenkins install
  user_data = <<-EOF
#!/bin/bash
set -eux

# 1. Package update
dnf upgrade -y

# 2. Java 21 + Jenkins必要パッケージ
dnf install -y wget fontconfig java-21-amazon-corretto

# 3. Jenkins LTS repository追加
wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/rpm-stable/jenkins.repo

# 4. Jenkinsインストール
dnf install -y jenkins

# 5. systemd再読込
systemctl daemon-reload

# 6. Jenkins自動起動有効化
systemctl enable jenkins

# 7. Jenkins起動
systemctl start jenkins

EOF

  tags = {
    Name = var.ec2_name
  }


  lifecycle {
    ignore_changes = [
      user_data
    ]
  }
}