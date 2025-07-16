resource "null_resource" "null_copy_ssh_privatekey_to_public_instance" {
  depends_on = [yandex_compute_instance.public_instance]
  connection {
    host = yandex_compute_instance.public_instance.network_interface.0.nat_ip_address
    type = "ssh"
    user = var.default_user
    private_key = "${local.public_ssh_key}"
  }
  provisioner "file" {
    source = local.privat_ssh_key
    destination = local.privat_ssh_key_push
  }
  provisioner "remote-exec" {
    inline = [ "sudo chmod 400 ${local.privat_ssh_key_push}" ]
  }
}


