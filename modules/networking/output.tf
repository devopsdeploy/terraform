output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "public_subnet_id" {
  value = "${aws_subnet.public_subnet.id}"
}

output "private_subnet_id" {
  value = "${aws_subnet.private_subnet.id}"
}

output "default_sg_id" {
  value = "${aws_security_group.default.id}"
}

output "bastion_sg_id" {
  value = "${aws_security_group.bastion.id}"
}


output "dns_private_zone_id" {
  value = "${aws_route53_zone.private_zone.id}"
}


/*
output "dns_public_zone_id" {
  value = "${aws_route53_zone.public_zone.id}"
}
*/