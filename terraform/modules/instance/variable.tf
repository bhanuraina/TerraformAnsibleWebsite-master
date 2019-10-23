# Variables

variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "eu-west-2"
}
variable "vpc_id" {
  description = "VPC id"
  default = ""
}
variable "subnet_public_id" {
  description = "VPC public subnet id"
  default = ""
}
variable "security_group_ids" {
  description = "EC2 ssh security group"
  type = "list"
  default = []
}
variable "environment_tag" {
  description = "Environment tag"
  default = "poc"
}
variable "key_pair_name" {
  description = "EC2 Key pair name"
  default = ""
}
variable "instance_ami" {
  description = "EC2 instance ami"
  default = "ami-00a1270ce1e007c27"
  #default = "ami-0007489126bb76c2e"	
}
variable "instance_type" {
  description = "EC2 instance type"
  default = "t2.micro"
}

variable "instance_count" {
  default = "3"
}

