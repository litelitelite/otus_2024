resource "local_file" "ansible_inventory" {
  content = templatefile("inventory.tpl",
    {
        ansible_nginx_ip =  [
      for instance_key, instance in yandex_compute_instance.nginx : instance.network_interface.0.nat_ip_address
    ]
        ansible_db_ip = [
      for instance_key, instance in yandex_compute_instance.db : instance.network_interface.0.nat_ip_address
    ]
        ansible_app_ip = [
      for instance_key, instance in yandex_compute_instance.backend : instance.network_interface.0.nat_ip_address
    ]        
    }
  )
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