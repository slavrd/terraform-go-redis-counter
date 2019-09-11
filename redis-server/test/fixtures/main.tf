terraform {
  required_version = "~> 0.12.7"
}

provider "aws" {
  version = "~> 2.26.0"
}

resource "aws_key_pair" "kitchen-test" {
  key_name   = "kitchen-wc-redis-${formatdate("YYYYMMDDHHmmss", timestamp())}"
  public_key = file("${path.root}/${var.ssh_pub_key_path}")

  lifecycle {
    ignore_changes = [key_name]
  }
}

module "redis" {
  source           = "../../"
  ami_id           = var.ami_id
  key_name         = aws_key_pair.kitchen-test.key_name
  private_key_path = "${path.root}/${var.ssh_private_key_path}"
  redis_password   = var.redis_password
  associate_public_ip_address = true
}