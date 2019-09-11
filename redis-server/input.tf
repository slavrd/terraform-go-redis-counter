variable "ami_id" {
  type        = string
  description = "The AWS AMI id to use for the Redis server VM."
}

variable "key_name" {
  type        = string
  description = "The AWS Key Pair name to use for the Redis server VM."
}

variable "private_key_path" {
  type        = string
  description = "The the private key of the AWS Key Pair used for the Redis server VM."
}

variable "redis_password" {
  type        = string
  description = "The password for the Redis server."
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The type of the Redis server VM to create."
}

variable "subnet_id" {
  type        = string
  default     = null
  description = "The subnet id in which to create the Redis server VM."
}

variable "associate_public_ip_address" {
  type        = bool
  default     = false
  description = "Weather the Redis server VM should have public ip address."
}
