output "webcounter_public_dns" {
  value = module.webcounter.webcounter_public_dns
}

output "webcounter_public_ips" {
  value = module.webcounter.webcounter_public_ips
}

output "redis_address" {
  value = var.redis_address
}

output "redis_password" {
  value = var.redis_password
}