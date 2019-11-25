variable "ssh_pub_key_path" {
  type        = string
  description = "Realtive path to the public key to use for creating the test AWS key pair."
  default     = "../assets/kitchen-wc-test.pub"
}

variable "ssh_private_key_path" {
  type        = string
  description = "Realtive path to the private key of the test AWS key pair."
  default     = "../assets/kitchen-wc-test"
}

variable "ami_id" {
  type        = string
  description = "The AWS AMI id to use for the webcounter VMs"
}

variable "redis_address" {
  type        = string
  description = "Dummy Redis server address."
}

variable "redis_password" {
  type        = string
  description = "Dummy Redis server password."
}

variable "name_prefix" {
  type        = string
  default     = "kitchen-test"
  description = "Prefix for the Name tag for all resources."
}

variable "common_tags" {
  type = map
  default = {
    owner   = "kitchen-test"
    project = "kitchen-test-webcounter"
  }
  description = "Default tags which will be applied to all the created resources. Name tag is set separetely used name_prefix."
}
