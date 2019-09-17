terraform {
  required_version = "~> 0.12.7"
}

provider "aws" {
  version = "~> 2.26.0"
}

provider "null" {
  version = "~> 2.1"
}

resource "aws_key_pair" "kitchen-test" {
  key_name   = "kitchen-wc-${formatdate("YYYYMMDDHHmmss", timestamp())}"
  public_key = file("${path.root}/${var.ssh_pub_key_path}")

  lifecycle {
    ignore_changes = [key_name]
  }
}

data "aws_vpcs" "default" {
  filter {
    name   = "isDefault"
    values = ["true"]
  }
}

data "aws_subnet_ids" "default_subnets" {
  vpc_id = tolist(data.aws_vpcs.default.ids)[0]
}

data "aws_ami" "wc_latest" {
  owners           = ["self"]
  most_recent      = true
  name_regex       = "^webcounter-\\d+\\.\\d+\\.\\d+-\\d+$"
}

module "webcounter" {
  source           = "../../"
  ami_id           = data.aws_ami.wc_latest.id
  key_name         = aws_key_pair.kitchen-test.key_name
  private_key_path = "${path.root}/${var.ssh_private_key_path}"
  redis_address    = var.redis_address
  redis_password   = var.redis_password
  subnet_ids       = data.aws_subnet_ids.default_subnets.ids
  instance_count   = 2
}
