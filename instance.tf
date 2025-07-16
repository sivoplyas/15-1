resource "yandex_compute_instance" "nat_instance" {
  name            = var.nat_instance_vm_name
  hostname        = var.nat_instance_vm_name
  platform_id     = var.nat_instance_platform_id
  resources {
    cores         = var.nat_instance_cpu
    memory        = var.nat_instance_ram
    core_fraction = var.nat_instance_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = var.nat_instance_image_id
      type     = var.nat_instance_disk_type
      size     = var.nat_instance_disk_volume
    }
  }
  scheduling_policy {
    preemptible = var.nat_instance_preemptible
  }
  network_interface {
    subnet_id  = yandex_vpc_subnet.public.id
    nat        = var.nat_instance_use_nat
    ip_address = var.nat_instance_ip_address
  }
  allow_stopping_for_update = var.nat_instance_stopping_for_update
  metadata = {
    serial-port-enable = var.nat_instance_serial_port_enable
    ssh-keys           = "${var.default_user}:${local.public_ssh_key_pub}"
  }
}

resource "yandex_compute_instance" "public_instance" {
  name            = var.public_instance_vm_name
  hostname        = var.public_instance_vm_name
  platform_id     = var.public_instance_platform_id
  resources {
    cores         = var.public_instance_cpu
    memory        = var.public_instance_ram
    core_fraction = var.public_instance_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.osfamily.image_id
      type     = var.public_instance_disk_type
      size     = var.public_instance_disk_volume
    }
  }
  scheduling_policy {
    preemptible = var.public_instance_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat       = var.public_instance_use_nat
  }
  allow_stopping_for_update = var.public_instance_stopping_for_update
  metadata = {
    serial-port-enable = var.public_instance_serial_port_enable
    ssh-keys           = "${var.default_user}:${local.public_ssh_key_pub}"
  }
}
resource "yandex_compute_instance" "private_instance" {
  name            = var.private_instance_vm_name
  hostname        = var.private_instance_vm_name
  platform_id     = var.private_instance_platform_id
  resources {
    cores         = var.private_instance_cpu
    memory        = var.private_instance_ram
    core_fraction = var.private_instance_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.osfamily.image_id
      type     = var.private_instance_disk_type
      size     = var.private_instance_disk_volume
    }
  }
  scheduling_policy {
    preemptible = var.private_instance_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.private.id
    nat       = var.private_instance_use_nat
  }
  allow_stopping_for_update = var.private_instance_stopping_for_update
  metadata = {
    serial-port-enable = var.private_instance_serial_port_enable
    ssh-keys           = "${var.default_user}:${local.privat_ssh_key_pub}"
    user-data = <<-EOF
                #cloud-config
                users:
                  - default
                  - name: ubuntu
                    groups:
                      - sudo
                    shell: /bin/bash
                    ssh_authorized_keys:
                      - "ecdsa-sha2-nistp256 ${local.privat_ssh_key_pub} ${var.default_user}@${yandex_compute_instance.public_instance.hostname}"
                    sudo: ALL=(ALL) NOPASSWD:ALL
                package_update: true
                packages:
                  - traceroute
                  - sudo
                  - net-tools
                  - curl
                runcmd:
                  - [systemctl, restart, sshd]
                  - echo "done" > /tmp/cloud-config.done
                EOF
  }
}
