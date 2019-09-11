variable "ssh_pub_key_path" {
  type        = string
  description = "Realtive path to the public key to use for creating the test AWS key pair."
  default     = "../assets/kitchen-wc-redis-test.pub"
}

variable "ssh_private_key_path" {
  type        = string
  description = "Realtive path to the private key of the test AWS key pair."
  default     = "../assets/kitchen-wc-redis-test"
}

variable "ami_id" {
  type        = string
  description = "The AWS AMI id to use for the webcounter VMs"
}

variable "redis_password" {
  type        = string
  description = "Dummy Redis server password."
}
