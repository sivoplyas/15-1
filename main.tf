resource "yandex_vpc_network" "my_network" {
  name = var.network_name
}

resource "yandex_vpc_subnet" "public" {
  name           = var.vpc_name_1
  zone           = var.zone
  network_id     = yandex_vpc_network.my_network.id
  v4_cidr_blocks = var.cidr_1
}

resource "yandex_vpc_address" "public_addr" {
  name = "public_address"
  external_ipv4_address {
    zone_id                  = var.zone
    ddos_protection_provider = "qrator"
  }
}

resource "yandex_vpc_subnet" "private" {
  name           = var.vpc_name_2
  zone           = var.zone
  network_id     = yandex_vpc_network.my_network.id
  v4_cidr_blocks = var.cidr_2
  route_table_id = yandex_vpc_route_table.private_vpc_route_table.id
}

resource "yandex_vpc_route_table" "private_vpc_route_table" {
  name       = "private_vpc_route_table"
  network_id = yandex_vpc_network.my_network.id
  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = var.nat_instance_ip_address
  }
}

