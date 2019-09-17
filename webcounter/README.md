# Terraform module - webcounter application

A Terraform module that deploys an AWS EC2 instance(s) and a security group. The AMI used for the instance is assumed to have the webcounter application installed as a systemd service.

The security group has incoming connections allowed for ports `8000`(webcounter default port) and `22`(SSH).

In case that a list of subnets is provided, the instances will be spread across them.

Input variables for the module are defined in `input.tf`.

**Notes:**

* It is assumed that the instance should be publicly accessible and so the variable `associate_public_ip_address` defaults to `true`.
* The webcounter service environment variables are set via a terraform provisioner. Because of this it must be possible to establish an ssh connection between the machine running terraform and the created VMs. The values of the environment variables that can be set are provided as module inputs.

## Testing with Kitchen-Terraform

The wrapper code used to test the module is located in `test/fixtures`. It defines the module and also creates a temporary AWS key pair from the keys located in `test/assets`.

Currently the test will create the instances in the default VPC of the region.

Input variables for the test are defined `test/fixtures/test.tfvars` and can be changed as needed.