# Here we define the Bastion Host Key
resource "aws_key_pair" "bastion_key" {
  key_name   = "bastion_sshkey"
  #public_key = "${file("${path.module}/keys/bastion_key.pub")}"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAEEWWRR334Dd5n2cYKUUeGVt4b6WgWTHAvMG++scWc8IO5Ca5sYJOCZBq0Ti3425234523YmYwp5lhGV6JyKsIZaSiwxQUAto0BOgobMGaYZ0cnmcWX3GL3zwvhAc7eLPpcYL0/PZ8PotamB1FVYFLdUi0LEQ/R3GZFxBcp8b2mzoW4jWGb6loC8HyrX6SMObgn6PQyp7f8EpcI0tZYQZfyWDyGHqmk4TLVevK/K2YfqiF69s+bZdwefqwer@432523523HRiyFzFaHNGBh8XSIUFAXzZHeGLEaGfIa1b3d1XXsz8HEi4rOvi20Q1CGUC/Aj3DeGQd6osRh3lkgZ/Dvp3tN staging_key"
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
