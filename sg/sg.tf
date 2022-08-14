resource "aws_security_group" "ec2_sg" {
  name        = var.sg_name
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc


  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = var.cidr_blocks_id
    ipv6_cidr_blocks = ["::/0"]

  }

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.cidr_blocks_id
    ipv6_cidr_blocks = ["::/0"]

  }

  }

resource "aws_security_group" "rds_sg" {
  name        = var.sg_name1
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc


  ingress {
    description      = "TLS from VPC"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups  = [aws_security_group.ec2_sg.id]
    ipv6_cidr_blocks = ["::/0"]

  }

}