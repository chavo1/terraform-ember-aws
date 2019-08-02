// Here we create the server
resource "aws_instance" "server" {
  ami                         = "${var.ami}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  subnet_id                   = "${var.subnet}"
  associate_public_ip_address = true

  // Our private key needed for connection to the servers 
  connection {
    user        = "ubuntu"
    private_key = "${file("~/.ssh/id_rsa")}"
    host        = "${self.public_ip}"
  }

  provisioner "file" {
    source      = "ember/"
    destination = "/tmp/"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo bash /tmp/ember.sh",
    ]
  }
}

// The output of the public ip
output "public_dns_servers" {
  value = "${aws_instance.server.*.public_dns}"
}
