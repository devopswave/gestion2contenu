resource "aws_instance" "app" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (HVM)
  instance_type = "t2.micro"
  key_name      = var.key_name
  subnet_id     = var.subnet_id

  tags = {
    Name = "CMSApp"
  }
}

output "instance_id" {
  value = aws_instance.app.id
}
