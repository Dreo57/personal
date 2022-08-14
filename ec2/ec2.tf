resource "aws_instance" "webserver" {
  ami           = var.ami_id
  instance_type = var.aws_instance
  associate_public_ip_address   = true
  subnet_id = var.sn_pub
  vpc_security_group_ids =  [var.sg_id]
  key_name = var.key_pair
  
  root_block_device {
    volume_size = 8
    volume_type = "gp2"
    }

  tags = {
    Name = "netflix-webserver"
  }
}
