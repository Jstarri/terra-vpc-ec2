resource "aws_instance" "web1" {
  ami           = var.AMI
  instance_type = "t2.micro"
  # VPC
  subnet_id = aws_subnet.terra-subnet-public.id

  # Security Group
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
  
  # the Public SSH key
  key_name = "north-virginia-public-key-pair"
  public_key = file("${var.PUBLIC_KEY_PATH}")

  connection {
    host        = self.public_ip
    user        = var.EC2_USER
    private_key = file("${var.PRIVATE_KEY_PATH}")
  }
}
