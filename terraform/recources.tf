
resource "yandex_compute_disk" "iscsi-disk" {
  name       = "iscsi-disk"
  type       = "network-hdd"
  zone       = var.yc_zone
  size       = 10
}

resource "local_file" "ansible_inventory" {
  content = templatefile("inventory.tpl", {
    db_external_ip = [
      for instance_key, instance in yandex_compute_instance.db : instance.network_interface.0.nat_ip_address
    ]
    backend_external_ip = [
      for instance_key, instance in yandex_compute_instance.backend : instance.network_interface.0.nat_ip_address
    ]
    nginx_external_ip = [
      for instance_key, instance in yandex_compute_instance.nginx : instance.network_interface.0.nat_ip_address
    ]
    iscsi_external_ip = [
      for instance_key, instance in yandex_compute_instance.iscsi : instance.network_interface.0.nat_ip_address
    ]
  })

  filename = "../ansible/inventory"

}

resource "yandex_vpc_network" "otus-learning" {
  name = var.otus_network_name
}

resource "yandex_vpc_subnet" "otus-learning-ru-central1-b" {
  name = var.otus_subnet_name
  network_id = "${yandex_vpc_network.otus-learning.id}"
  v4_cidr_blocks = ["10.0.1.0/24"] 
}

