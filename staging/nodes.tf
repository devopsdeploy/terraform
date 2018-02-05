resource "aws_key_pair" "node_key" {
  key_name   = "node_sshkey"
  public_key = "${file("keys/node_key.pub")}"
}



module "user1" {
  source              = "../modules/node"
  region              = "${var.region}"
  instance_type       = "t2.micro"
  private_subnet_id   = "${module.networking.private_subnet_id}"
  public_subnet_id    = "${module.networking.public_subnet_id}"
  vpc_sg_id           = "${module.networking.default_sg_id}"
  key_name            = "${aws_key_pair.node_key.id}"
  environment         = "${var.environment}"
  vpc_id              = "${module.networking.vpc_id}"
  vpc_cidr_block      = "${module.networking.bastion_sg_id}"
  node_owner          = "user1"
  dns_record          = "aws1-build-01"
  dns_zone_id         = "${module.networking.dns_private_zone_id}"
  dns_domain          = "devopsdeploy.com"
  #user_data           = "${file("${path.module}/files/${var.node_owner}-user_data.sh")}"
}



/*
module "user2" {
  source              = "../modules/node"
  region              = "${var.region}"
  instance_type       = "t2.large"
  private_subnet_id   = "${module.networking.private_subnet_id}"
  public_subnet_id    = "${module.networking.public_subnet_id}"
  vpc_sg_id           = "${module.networking.default_sg_id}"
  key_name            = "${aws_key_pair.node_key.id}"
  environment         = "${var.environment}"
  vpc_id              = "${module.networking.vpc_id}"
  vpc_cidr_block      = "${module.networking.bastion_sg_id}"

  node_owner          = "user2"
  dns_record          = "aws1-build-02"
  dns_zone_id         = "${module.networking.dns_private_zone_id}"
  dns_domain          = "devopsdeploy.com"
  #user_data           = "${file("${path.module}/files/user2-user_data.sh")}"
}
*/