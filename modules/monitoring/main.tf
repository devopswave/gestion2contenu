resource "aws_instance" "monitoring" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (HVM)
  instance_type = "t2.micro"
  key_name      = var.key_name
  subnet_id     = var.subnet_id

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y docker",
      "sudo service docker start",
      "sudo usermod -a -G docker ec2-user",
      "sudo docker run -d --name prometheus -p 9090:9090 prom/prometheus",
      "sudo docker run -d --name grafana -p 3000:3000 grafana/grafana"
    ]
  }

  tags = {
    Name = "Monitoring"
  }
}

output "monitoring_url" {
  value = "http://${aws_instance.monitoring.public_ip}:3000"
}
