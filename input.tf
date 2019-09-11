variable "key_pair_name" {
  type        = string
  description = "The AWS Key Pair name to use for the VMs"
}

variable "private_key_path" {
  type        = string
  description = "The the private key of the AWS Key Pair used for the VMs"
}

variable "redis_password" {
  type        = string
  description = "The password for the Redis server the webcounter should connect to."
}

variable "wc_ami_id" {
  type        = string
  description = "The AWS AMI id to use for the webcounter VMs"
}

variable "wc_instance_count" {
  type        = number
  default     = 1
  description = "The number of webcounter VMs to create."
}

variable "wc_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The type of the webcounter VMs to create."
}

variable "wc_subnet_id" {
  type        = string
  default     = null
  description = "The subnet id in which to create the webcounter VMs."
}

variable "wc_associate_public_ip_address" {
  type        = bool
  default     = true
  description = "Weather the webcounter VMs should have public ip address."
}

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
