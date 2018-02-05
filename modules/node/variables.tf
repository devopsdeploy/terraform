#variable "node_instance_count" {
#  description = "The total of node instances to run"
#}

variable "region" {
  description = "The region to launch the instances"
}

variable "amis" {
  default = {
    "us-east-1" = "ami-r655979b"
    "us-east-2" = "ami-fac13b99"
    "us-west-1" = "ami-14eff076"
  }
}

variable "instance_type" {
  description = "The instance type to launch"
}

variable "private_subnet_id" {
  description = "The id of the private subnet to launch the instances"
}

variable "public_subnet_id" {
  description = "The id of the public subnet to launch the load balancer"
}

variable "vpc_sg_id" {
  description = "The default security group from the vpc"
}

variable "vpc_cidr_block" {
  description = "The CIDR block from the VPC"
}

variable "key_name" {
  description = "The keypair to use on the instances"
}

variable "environment" {
  description = "The environment for the instance"
}

variable "vpc_id" {
  description = "The id of the vpc"
}

variable "node_owner" {
  description = "The name of the node owner"
}

variable "dns_record" {
  description = "Hostname to be added to dns"
}

variable "dns_domain" {
  description = "Domain Name Used"
}

variable "dns_zone_id" {
  description = "DNS Zone Id"
}
