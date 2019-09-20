variable "redis_ami_id" {
  type        = string
  description = "The AWS AMI id to use for the Redis server VM."
}

variable "redis_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The type of the Redis server VM to create."
}

variable "redis_subnet_id" {
  type        = string
  default     = null
  description = "The subnet id in which to create the Redis server VM."
}

variable "redis_associate_public_ip_address" {
  type        = bool
  default     = false
  description = "Weather the Redis server VM should have public ip address."
}
