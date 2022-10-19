resource "aws_instance" "web1" {
  ami           = var.AMI
  instance_type = "t2.micro"
  # VPC
  subnet_id = aws_subnet.terra-subnet-public.id

  # Security Group
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]

  # the Public SSH key
  key_name = aws_key_pair.north-virginia-region-key-pair.id

  connection {
    host        = self.public_ip
    user        = var.EC2_USER
    private_key = file("${var.PRIVATE_KEY_PATH}")
  }
}

// Sends your public key to the instance
resource "aws_key_pair" "north-virginia-region-key-pair" {
  key_name   = "north-virginia-region-key-pair"
  public_key = file("north-virginia-region-key-pair.pub")
}
