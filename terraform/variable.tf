variable "access_key" { }
variable "secret_key" { }
variable "region" {
  default = "eu-west-2"
}
variable "availability_zone" {
  default = "eu-west-2a"
}
variable "environment_tag" {
  description = "Environment tag"
  default = "dev"
}

