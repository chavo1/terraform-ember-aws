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
#### With terraform it will spin-up one EC2 instance in AWS.
```
terraform init
terraform apply
```

#### If you want to create your own project please follow the below step:

### Setup ember hello world

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
