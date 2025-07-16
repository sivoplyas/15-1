variable "token" {
  type        = string
  default     = ""
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "network_name" {
  type        = string
  default     = ""
  description = "VPC network name"
}

variable "zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vpc_name_1" {
  type        = string
  default     = "public"
  description = "VPC 1 subnet name"
}

variable "cidr_1" {
  type        = list(string)
  default     = ["192.168.10.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name_2" {
  type        = string
  default     = "private"
  description = "VPC 1 subnet name"
}

variable "cidr_2" {
  type        = list(string)
  default     = ["192.168.20.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "default_user" {
  type        = string
  default     = "ubuntu"
  description = "Default user via ssh"
}

variable "family" {
  type        = string
  default     = "ubuntu-2404-lts"
  description = "OS family"
}

variable "private_instance_vm_name" {
  type        = string
  default     = "private-instance"
  description = "Virtual machine name"
}

variable "private_instance_cpu" {
  type        = number
  default     = 2
  description = "Number of CPU cores for this virtual machine"
}

variable "private_instance_ram" {
  type        = number
  default     = 2
  description = "RAM capacity for this virtual machine"
}

variable "private_instance_core_fraction" {
  type        = number
  default     = 2
  description = "CPU core fraction in percents for this virtual machine"
}

variable "private_instance_disk_type" {
  type        = string
  default     = "HDD"
  description = "Disk type for this virtusl machine"
}

variable "private_instance_disk_volume" {
  type        = number
  default     = 10
  description = "Disk volume in Gb"
}

variable "private_instance_platform_id" {
  type        = string
  default     = "standart-v1"
  description = "Yandex platform ID for this virtual machine"
}

variable "private_instance_preemptible" {
  type        = bool
  default     = true
  description = "This virtual machine is preemptible?"
}

variable "private_instance_use_nat" {
  type        = bool
  default     = false
  description = "This virtual machine use nat?"
}

variable "private_instance_stopping_for_update" {
  type        = bool
  default     = true
  description = "This virtuel machine stopping for update?"
}

variable "private_instance_serial_port_enable" {
  type        = number
  default     = 0
  description = "This virtual machine serial port is enable (1-yes,0-no)?"
}

variable "nat_instance_vm_name" {
  type        = string
  default     = "nat-instance"
  description = "Virtual machine name"
}

variable "nat_instance_cpu" {
  type        = number
  default     = 2
  description = "Number of CPU cores for this virtual machine"
}

variable "nat_instance_ram" {
  type        = number
  default     = 2
  description = "RAM capacity for this virtual machine"
}

variable "nat_instance_core_fraction" {
  type        = number
  default     = 2
  description = "CPU core fraction in percents for this virtual machine"
}

variable "nat_instance_disk_type" {
  type        = string
  default     = "HDD"
  description = "Disk type for this virtusl machine"
}

variable "nat_instance_disk_volume" {
  type        = number
  default     = 10
  description = "Disk volume in Gb"
}

variable "nat_instance_platform_id" {
  type        = string
  default     = "standart-v1"
  description = "Yandex platform ID for this virtual machine"
}

variable "nat_instance_image_id" {
  type        = string
  default     = "fd80mrhj8fl2oe87o4e1"
  description = "OS image for this virtual machine"
}

variable "nat_instance_preemptible" {
  type        = bool
  default     = true
  description = "This virtual machine is preemptible?"
}

variable "nat_instance_ip_address" {
  type        = string
  default     = "192.168.10.254"
  description = "This virtual machine ip address"
}

variable "nat_instance_use_nat" {
  type        = bool
  default     = true
  description = "This virtual machine use nat?"
}

variable "nat_instance_stopping_for_update" {
  type        = bool
  default     = true
  description = "This virtuel machine stopping for update?"
}

variable "nat_instance_serial_port_enable" {
  type        = number
  default     = 0
  description = "This virtual machine serial port is enable (1-yes,0-no)?"
}

variable "public_instance_vm_name" {
  type        = string
  default     = "public-instance"
  description = "Virtual machine name"
}

variable "public_instance_cpu" {
  type        = number
  default     = 2
  description = "Number of CPU cores for this virtual machine"
}

variable "public_instance_ram" {
  type        = number
  default     = 2
  description = "RAM capacity for this virtual machine"
}

variable "public_instance_core_fraction" {
  type        = number
  default     = 2
  description = "CPU core fraction in percents for this virtual machine"
}

variable "public_instance_disk_type" {
  type        = string
  default     = "HDD"
  description = "Disk type for this virtusl machine"
}

variable "public_instance_disk_volume" {
  type        = number
  default     = 10
  description = "Disk volume in Gb"
}

variable "public_instance_platform_id" {
  type        = string
  default     = "standart-v1"
  description = "Yandex platform ID for this virtual machine"
}

variable "public_instance_preemptible" {
  type        = bool
  default     = true
  description = "This virtual machine is preemptible?"
}

variable "public_instance_use_nat" {
  type        = bool
  default     = true
  description = "This virtual machine use nat?"
}

variable "public_instance_stopping_for_update" {
  type        = bool
  default     = true
  description = "This virtuel machine stopping for update?"
}

variable "public_instance_serial_port_enable" {
  type        = number
  default     = 0
  description = "This virtual machine serial port is enable (1-yes,0-no)?"
}
