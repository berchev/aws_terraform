provider "aws" {}

resource "random_id" "server" {
  keepers     = {}
  byte_length = 8
}

resource "random_pet" "server" {
  keepers = {}
  length  = 2
}

resource "aws_instance" "server" {
  ami                         = "ami-0e32ec5bc225539f5"
  instance_type               = "t2.micro"
  key_name                    = "gberchev_key_pair"
  associate_public_ip_address = "true"

  tags {
    Name = "${random_pet.server.id}_${random_id.server.hex}"
  }
}
