output "nginx_instance_external_ip" {
  value = "${yandex_compute_instance.nginx.network_interface.0.nat_ip_address}"
}

output "db_instance_external_ip" {
  value = "${yandex_compute_instance.db.network_interface.0.nat_ip_address}"
}

output "app1_instance_external_ip" {
  value = "${yandex_compute_instance.app1.network_interface.0.nat_ip_address}"
}

output "app2_instance_external_ip" {
  value = "${yandex_compute_instance.app2.network_interface.0.nat_ip_address}"
}