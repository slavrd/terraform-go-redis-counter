module "network-basic" {
  source               = "github.com/slavrd/terraform-aws-basic-network?ref=0.1.1"
  vpc_cidr_block       = var.net_vpc_cidr_block
  public_subnet_cidrs  = var.net_public_subnet_cidrs
  private_subnet_cidrs = var.net_private_subnet_cidrs
  name_prefix          = var.name_prefix
  common_tags          = var.common_tags
}

module "webcounter" {
  source                      = "./webcounter"
  ami_id                      = var.wc_ami_id
  key_name                    = var.key_pair_name
  redis_address               = module.redis.redis_private_ip
  redis_password              = var.redis_password
  instance_count              = var.wc_instance_count
  instance_type               = var.wc_instance_type
  subnet_ids                  = module.network-basic.public_subnet_ids
  vpc_id                      = module.network-basic.vpc_id
  associate_public_ip_address = var.wc_associate_public_ip_address
  common_tags                 = var.common_tags
  name_prefix                 = var.name_prefix
}

module "redis" {
  source                      = "./redis-server"
  ami_id                      = var.redis_ami_id
  key_name                    = var.key_pair_name
  redis_password              = var.redis_password
  instance_type               = var.redis_instance_type
  subnet_id                   = module.network-basic.private_subnet_ids[0]
  vpc_id                      = module.network-basic.vpc_id
  associate_public_ip_address = var.redis_associate_public_ip_address
  common_tags                 = var.common_tags
  name_prefix                 = var.name_prefix
}