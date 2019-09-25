output "webcounter_public_dns" {
  value = module.webcounter.webcounter_public_dns
}

output "webcounter_public_ips" {
  value = module.webcounter.webcounter_public_ips
}

output "webcounter_addresses" {
  value = [for dns in module.webcounter.webcounter_public_dns : "${dns}:8000/get"]
}
