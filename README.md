# This repo contains Vagrant and Terraform projects with a simple Web "Hello World" app with Ember CLI

## Prerequisites
- [Terraform](https://www.terraform.io/)
- [Packer](https://www.packer.io/)
  - | You can use [THIS](https://github.com/chavo1/packer-ember/tree/master/aws-ami) GitHub repo to prepare your custom AWS AMI

## Clone the repo
```
git clone https://github.com/chavo1/terraform-ember-aws.git
cd terraform-ember-aws
```
### I will use [THIS](https://github.com/chavo1/hello-world) ember project it is automated with Terraform for AWS deployment.
#### Terraform will spin-up Two EC2 instances in AWS - one for each Terraform workspace.
- First create two .tfvars files one for prod and one for dev (just change the network) refer to the example .
```
terraform workspace new prod //will create prod workspace 
terraform init
terraform apply -var-file=terraform_prod.tfvars
terraform destroy -var-file=terraform_prod.tfvars // do not forget to destroy the environment
terraform workspace new dev //will create dev workspace 
terraform init
terraform apply -var-file=terraform_dev.tfvars
terraform destroy -var-file=terraform_dev.tfvars // do not forget to destroy the environment
```
- You can switch the workspaces with a following commands:
```
terraform workspace list // will list all workspaces 
terraform workspace select prod
terraform workspace select dev
```
- Terraform state file will be created in the terraform.tfstate.d directory in dedicated folders.
