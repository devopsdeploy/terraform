/* Security group for the node */
resource "aws_security_group" "node_server_sg" {
  name        = "${var.environment}-${var.node_owner}-sg"
  description = "Security group for node that allows node traffic from internet"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    security_groups = ["${var.vpc_cidr_block}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name        = "${var.environment}-${var.node_owner}-sg"
    Environment = "${var.environment}"
  }
}

/*  Node */
resource "aws_instance" "node" {
  #count             = "${var.node_instance_count}"
  ami               = "${lookup(var.amis, var.region)}"
  instance_type     = "${var.instance_type}"
  subnet_id         = "${var.private_subnet_id}"
  vpc_security_group_ids = [
    "${aws_security_group.node_server_sg.id}"
  ]
  key_name          = "${var.key_name}"
  user_data           = "${file("${path.module}/files/${var.node_owner}-user_data.sh")}"
  #user_data         = "${var.user_data}"
  #depends_on = ["aws_security_group.node_inbound_sg"]
  root_block_device {
    volume_size = 60
  }
  tags = {
    Name        = "${var.environment}-${var.node_owner}-${count.index+1}"
    Environment = "${var.environment}"
  }
}

resource "aws_route53_record" "record" {
  name = "${var.dns_record}.${var.dns_domain}"
  zone_id = "${var.dns_zone_id}"
  type = "A"
  ttl = "300"
  records = ["${element(aws_instance.node.*.private_ip, count.index)}"]
}

