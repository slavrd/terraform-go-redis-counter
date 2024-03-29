variable "ami_id" {
  type        = string
  description = "The AWS AMI id to use for the webcounter VMs"
}

variable "key_name" {
  type        = string
  description = "The AWS Key Pair name to use for the webcounter VMs"
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

variable "vpc_id" {
  type        = string
  default     = null
  description = "The VPC in which the machines will be created. Must be used together with subnet_ids."
}

variable "subnet_ids" {
  type        = list
  default     = null
  description = "The subnet id in which to create the webcounter VMs. Must be used together with vpc_id."
}

variable "associate_public_ip_address" {
  type        = bool
  default     = true
  description = "Weather the webcounter VMs should have public ip address."
}

variable "name_prefix" {
  type        = string
  default     = ""
  description = "Prefix for the Name tag for all resources."
}

variable "common_tags" {
  type = map
  default = {
    project = ""
    owner   = ""
  }
  description = "Default tags which will be applied to all the created resources. Name tag is set separetely used name_prefix."
}
