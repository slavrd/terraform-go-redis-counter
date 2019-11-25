module "wc_setup" {
  source         = "../../"
  key_pair_name  = aws_key_pair.test-keypair.key_name
  redis_password = "testRedisPass"
  name_prefix    = "kitchen-webcounter-full-deploy-${uuid()}"
  common_tags = {
    owner   = "kitchen-test-go-redis-counter"
    project = "kitchen-test-go-redis-counter"
  }
  net_vpc_cidr_block       = "172.27.0.0/24"
  net_public_subnet_cidrs  = ["172.27.0.0/28"]
  net_private_subnet_cidrs = ["172.27.0.32/28"]
  redis_ami_id             = data.aws_ami.redis.image_id
  wc_ami_id                = data.aws_ami.webcounter.image_id
}

data "aws_ami" "redis" {
  most_recent      = true
  name_regex       = ".*ubuntu-redis-.*"
  owners           = ["self"]
}

data "aws_ami" "webcounter" {
  most_recent      = true
  name_regex       = ".*webcounter-.*"
  owners           = ["self"]
}

resource "aws_key_pair" "test-keypair" {
  key_name   = "kitchen-webcounter-full-deploy-${uuid()}"
  public_key = file("${path.module}/../assets/wc-dep-test.pub")
}

output "webcounter_public_dns" {
    value = module.wc_setup.webcounter_public_dns
}