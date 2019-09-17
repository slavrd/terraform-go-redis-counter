# Terraform module - Redis server

A Terraform module that deploys an AWS EC2 instance and a security group for it. The AMI used for the instance is assumed to have a Redis server running and listening on `0.0.0.0:6379`

The security group has incoming connections allowed for ports `6379`(redis default) and `22`(SSH).

Input variables for the module are defined in `input.tf`.

**Notes:**

* It is assumed that the instance should not be publicly accessible and so the variable `associate_public_ip_address` defaults to `false`. It is intended to be set to `true` only for tests, when remote SSH connection is needed to run them.
* Redis authentication will be set up using the EC2 instance user data. The password needs to be provided as a module input variable.

## Testing with Kitchen-Terraform

The wrapper code used to test the module is located in `test/fixtures`. It defines the module and also creates a temporary AWS key pair from the keys located in `test/assets`

Currently the test fixture:

*  will create the instance in the default VPC of the region using one of the subnets in it.
*  will create the instance with the latest AMI found - owned by the AWS account of the user running the test and name that matches the regex `^ubuntu-redis-\\d+$`.

Input variables for the test are defined `test/fixtures/test.tfvars` and can be changed as needed.