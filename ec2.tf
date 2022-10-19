resource "aws_instance" "web1" {
  ami           = var.AMI
  instance_type = "t2.micro"
  # VPC
  subnet_id = aws_subnet.terra-subnet-public.id
  public_key = "north-virginia-region-key-pair.pub"

  # Security Group
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]

  connection {
    host        = self.public_ip
    user        = var.EC2_USER
    private_key = file("${var.PRIVATE_KEY_PATH}")
  }
}
