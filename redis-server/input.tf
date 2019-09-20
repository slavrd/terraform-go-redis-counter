variable "ami_id" {
  type        = string
  description = "The AWS AMI id to use for the Redis server VM."
}

variable "key_name" {
  type        = string
  description = "The AWS Key Pair name to use for the Redis server VM."
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

variable "vpc_id" {
  type = string
  default = null
  description = "The VPC in which the VM will be created. Must be used together with subnet_ids."
}

variable "subnet_id" {
  type        = string
  default     = null
  description = "The subnet id in which to create the Redis server VM. Must be used together with vpc_id."
}

variable "associate_public_ip_address" {
  type        = bool
  default     = false
  description = "Weather the Redis server VM should have public ip address."
}
