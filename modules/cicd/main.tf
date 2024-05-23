resource "aws_instance" "jenkins" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = var.key_name

  provisioner "remote-exec" {
    inline = [
      "apt update",
      "apt install -y openjdk-11-jdk curl wget",
      "curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null",
      "echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | tee /etc/apt/sources.list.d/jenkins.list > /dev/null",
      "apt update",
      "apt install -y jenkins",
      "systemctl start jenkins"
    ]
  }
}
