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

data "aws_ami" "redis_latest" {
  owners      = ["self"]
  most_recent = true
  name_regex  = ".*ubuntu-redis-\\d+$"
}

module "redis" {
  source                      = "../../"
  ami_id                      = data.aws_ami.redis_latest.id
  key_name                    = aws_key_pair.kitchen-test.key_name
  redis_password              = var.redis_password
  associate_public_ip_address = true
  name_prefix                 = var.name_prefix
  common_tags                 = var.common_tags
}