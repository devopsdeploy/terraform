# Here we define the Bastion Host Key
resource "aws_key_pair" "bastion_key" {
  key_name   = "bastion_sshkey"
  public_key = "${file("${path.module}/keys/bastion_key.pub")}"
}

# Now we create a bastion host
module "networking" {
  source              = "../modules/networking"
  environment         = "${var.environment}"
  vpc_cidr            = "${var.vpc_cidr}"
  public_subnet_cidr  = "${var.public_subnet_cidr}"
  private_subnet_cidr = "${var.private_subnet_cidr}"
  region              = "${var.region}"
  availability_zone   = "${var.availability_zone}"
  key_name            = "${aws_key_pair.bastion_key.id}"
  dns_domain          = "devopsdeploy.com"
  dns_record          = "uswest1-bastion-01"
  #dns_zone_id         = "${module.networking.dns_public_zone_id}"
  dns_zone_id         = "${module.networking.dns_private_zone_id}"

}
