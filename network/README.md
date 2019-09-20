# Terraform module - network

A terraform module that deploys a VPC and two types of subnets. 

Input variables for the module are defined in `input.tf`.

The CIDRs for the VPC and subents are passed as input list variables and it is the user's responsibility to calculate them so they make sense.

The subnet types are designated **public** and **private**.

* The **"public"** subnets allow for resources in it to be reachable from the internet
* The **private** subnets does not allow incoming connections from the internet, but still allows resources in it to connect to the internet.

**Notes:**

* To allow connectivity for the **private** subnet an `aws_nat_gateway` is created in the 1st public subnet in the list. Therefore the **public** subnet list can never be with `0` elements.
* The `common_tags` variable must contain at least the tags defined in its default value. The values of these tags are used to generate name tags for some of the resources created by the module.


## Testing with Kitchen-Terraform

The wrapper code used to test the module is located in `test/fixtures`. It defines the module and also creates a temporary AWS key pair from the keys located in `test/assets`

Currently the test fixture:

*  will create the networking infrastructure
*  will create an ubuntu xenial VM in each subnet with assigned public IP address
*  will test that the VMs in the **public** subnet are reachable and the ones in the **private** subnets are not.

Input variables for the test are defined `test/fixtures/test.tfvars` and can be changed as needed.