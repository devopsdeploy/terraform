resource "aws_route53_zone" "private_zone" {
  name = "${var.dns_domain}"
  vpc_id = "${aws_vpc.vpc.id}"
}

/*
resource "aws_route53_zone" "public_zone" {
  name = "${var.dns_domain}"
}

resource "aws_route53_record" "ns_record" {
  name = "${var.dns_domain}"
  zone_id = "${var.dns_zone_id}"
  type = "NS"
  ttl = "300"
  records = [
    "ns-223.awsdns-27.com",
    "ns-1970.awsdns-41.co.uk",
    "ns-1439.awsdns-13.org",
    "ns-99221.awsdns-10.net"
  ]
}
*/