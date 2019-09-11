output "redis_public_dns" {
  value = module.redis.redis_public_dns
}

output "redis_public_ips" {
  value = module.redis.redis_public_ip
}

output "redis_private_dns" {
  value = module.redis.redis_private_dns
}

output "redis_private_ip" {
  value = module.redis.redis_private_ip
}

output "redis_password" {
  value = var.redis_password
}