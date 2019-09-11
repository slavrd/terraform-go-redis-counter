module "webcounter" {
  source                      = "./webcounter"
  ami_id                      = var.wc_ami_id
  key_name                    = var.key_pair_name
  private_key_path            = var.private_key_path
  redis_address               = module.redis.redis_private_ip
  redis_password              = var.redis_password
  instance_count              = var.wc_instance_count
  instance_type               = var.wc_instance_type
  subnet_id                   = var.wc_subnet_id
  associate_public_ip_address = var.wc_associate_public_ip_address
}

module "redis" {
  source                      = "./redis-server"
  ami_id                      = var.redis_ami_id
  key_name                    = var.key_pair_name
  redis_password              = var.redis_password
  instance_type               = var.redis_instance_type
  subnet_id                   = var.redis_subnet_id
  associate_public_ip_address = var.redis_associate_public_ip_address
}