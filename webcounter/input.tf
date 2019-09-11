variable "ami_id" {
  type        = string
  description = "The AWS AMI id to use for the webcounter VMs"
}

variable "key_name" {
  type        = string
  description = "The AWS Key Pair name to use for the webcounter VMs"
}

variable "private_key_path" {
  type        = string
  description = "The the private key of the AWS Key Pair used for the webcounter VMs"
}

variable "redis_address" {
  type        = string
  description = "The address of the Redis server the webcounter should connect to."
}

variable "redis_password" {
  type        = string
  description = "The password for the Redis server the webcounter should connect to."
}

variable "instance_count" {
  type        = number
  default     = 1
  description = "The number of webcounter VMs to create."
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The type of the webcounter VMs to create."
}

variable "subnet_id" {
  type        = string
  default     = null
  description = "The subnet id in which to create the webcounter VMs."
}

variable "associate_public_ip_address" {
  type        = bool
  default     = true
  description = "Weather the webcounter VMs should have public ip address."
}
