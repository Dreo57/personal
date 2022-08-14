resource "aws_db_subnet_group" "db_sngp" {
  name       = "db_subnet_main"
  subnet_ids = [var.sn, var.sn1]

  tags = {
    Name = "My DB subnet group"
  }
}