# Terraform - webcounter

A Terraform configuration to deploy the [webcounter](https://github.com/slavrd/go-redis-counter/tree/master/webcounter) application in AWS.

The root module of the configuration is used to define two sub-modules - `network`, `webcounter` and `redis-server`, placed in respectively named sub directories. For details on each submodule check their readme.

The modules create a VPC and subnets in which then deploy EC2 instances from pre-built AMIs. The AMIs are built using the following packer projects - [`webcounter`](https://github.com/slavrd/packer-go-redis-counter-aws), [`redis-server`](https://github.com/slavrd/packer-aws-redis64).

All modules are tested using [`Kitchen-Terraform`](https://newcontext-oss.github.io/kitchen-terraform/).

## Prerequisites

* Install [Terraform](https://www.terraform.io/downloads.html)
* Set up AWS [authentication](https://www.terraform.io/docs/providers/aws/index.html#authentication) using environment variables or shared credentials file.

## Usage

* Set up AWS region using environment variable - `export AWS_REGION=my-aws-region`.
* Assign values to the terraform input variables - [help](https://www.terraform.io/docs/configuration/variables.html#assigning-values-to-root-module-variables). The variables and their descriptions are defined in the `input.*.tf` files.
* run `terraform init` to initialize the terraform project.
* run `terraform plan|apply|destroy` to manage the AWS resources.

## Testing with Terraform-Kitchen

Prerequisites:

* Ruby with version defined in the `Gemfile`.
* Gems described in `Gemfile`. Recommended to use ruby [bundler](https://bundler.io/) - run `bundle install`.

Setting up tests:

* set AWS region for the test - `export AWS_REGION=my-aws-region`.
* create a file named `test.tfvars` with the terraform input variable values to be used for the test. The file path can be changed using the `driver.variable_files` key in `.kitchen.yml`. Example file:

```HCL
key_pair_name     = "general-key"
wc_ami_id         = "ami-039b608d6700512d0"
redis_password    = "myTestPa$$w0rd"
redis_ami_id      = "ami-00746ca514369159d"
wc_instance_count = 1
net_vpc_cidr_block = "172.16.16.0/20"
net_public_subnet_cidrs = ["172.16.16.0/24"]
net_private_subnet_cidrs = ["172.16.20.0/24"]
common_tags = {
    project = "webcounter"
    environment = "kitchen-test"
}
```

Running tests (assuming using bundler):

* run `bundle exec kitchen converge` - build the test environment
* run `bundle exec kitchen verify` - run the tests
* run `bundle exec kitchen destroy` - destroy testing environment

**Note:** At least several seconds are needed between building the environment and running the tests. That is why using the `kitchen test` command to automatically perform the three actions above can sometimes fail.
