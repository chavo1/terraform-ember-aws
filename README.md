# This repo contains Terraform projects with a simple Web "Hello World" app with Ember CLI

## Prerequisites
- [Terraform](https://www.terraform.io/)
- [Packer](https://www.packer.io/)
  - | You can use [THIS](https://github.com/chavo1/packer-ami-ember) GitHub repo to prepare your custom AWS AMI

## Clone the repo
```
git clone https://github.com/chavo1/terraform-ember-aws.git
cd terraform-ember-aws
```
### I will use [THIS](https://github.com/chavo1/hello-ember) ember project it is automated with Terraform for AWS deployment.
#### Terraform will spin-up Two EC2 instances in AWS - one for each Terraform workspace.
- First create two .tfvars files one for prod and one for dev (just change the network) refer to the example .
```
terraform workspace new test // will create test workspace 
terraform init
terraform apply -var-file=terraform_test.tfvars
terraform destroy -var-file=terraform_test.tfvars // do not forget to destroy the environment
terraform workspace new prod // will create prod workspace 
terraform init
terraform apply -var-file=terraform_prod.tfvars
terraform destroy -var-file=terraform_prod.tfvars // do not forget to destroy the environment
```
- You can switch the workspaces with a following commands:
```
terraform workspace list // will list all workspaces 
terraform workspace select prod
terraform workspace select test
```
- Terraform state file will be created in the terraform.tfstate.d directory in dedicated folders.

#### To test you will need Kitchen:

Kitchen is a RubyGem so please find how to install and setup Test Kitchen for developing infrastructure code, check out the [Getting Started Guide](http://kitchen.ci/docs/getting-started/).

- To install needed [gems](https://guides.rubygems.org/what-is-a-gem/) you need to install bundler:

```
gem install bundler
bundle install
```
- Than simply execute a following commands:

```
bundle exec kitchen converge
bundle exec kitchen verify
bundle exec kitchen destroy
```
- The result should be - saving a screenshot of the web page in scr directory and the output from the HTTP test:
<img src="scr/screen.png" width="512" height="270">
``` 
  HTTP GET on http://ec2-35-172-231-144.compute-1.amazonaws.com:4200
     ✔  status should cmp == 200

Test Summary: 1 successful, 0 failures, 0 skipped
       Finished verifying <default-terraform> (0m9.08s).
-----> Kitchen is finished. (0m11.25s)
```
- You need to test with different .tfvars file, just change with appropriate value in .kitchen.yml

```
  variable_files:
    - terraform_prod.tfvars
```
