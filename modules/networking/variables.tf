variable "vpc_cidr" {
  description = "The CIDR block of the VPC"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
}

variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet"
}

variable "environment" {
  description = "The environment"
}

variable "region" {
  description = "The region to launch the bastion host"
}

variable "availability_zone" {
  description = "The az that the resources will be launched"
}

variable "dns_domain" {
  description = "DNS Domain to Use"
}

variable "dns_zone_id" {
  description = "DNS Zone Id"
}

variable "bastion_ami" {
  type = "map"
  default = {
    "us-east-1" = "ami-f652979b"
    "us-east-2" = "ami-fcc19b99"
    "us-west-1" = "ami-16efb076"
  }
}

variable "key_name" {
  description = "The public key for the bastion host"
}

variable "dns_record" {
  description = "Hostname to be added to dns"
}
