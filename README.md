# This repo contains Vagrant and Terraform projects with a simple Web "Hello World" app with Ember CLI

## Prerequisites

- [Vagrant](https://www.vagrantup.com/)
- [Terraform](https://www.terraform.io/)

## Clone the repo
```
git clone https://github.com/chavo1/vagrant-emberjs.git
cd vagrant-emberjs
```

#### I will use [THIS](https://github.com/chavo1/hello-world) ember project it is automated for Vagrant and Terraform-AWS deployment so just:
```
vagrant up
```
#### With terraform it will spin-up Two EC2 instances in AWS - one for each Terraform workspace.
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
### If you want to create your own project please follow the below step:

#### Setup ember hello world

```
vagrant ssh
sudo su -
```
#### Create an Ember project 
```
ember new hello-world
```
#### Change the file "hello-world/app/templates/application.hbs" as follow:
```
<h1>Hello World</h1>

{{outlet}}
```
#### Archive the project directory
```
zip -r /vagrant/ember/hello-world.zip hello-world
cd hello-world
```
#### Just start Ember and click on the link that will appear or open a web browser and access http://localhost:4200:
```
ember serve
```
