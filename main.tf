module "ember" {
  source = "./server"

  region        = "${var.region}"
  instance_type = "${var.instance_type}"
  key_name      = "${var.key_name}"
  subnet        = "${var.subnet}"
  ami           = "${var.ami}"
}
