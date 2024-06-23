output "nginx_instance_external_ip" {
  value = [
    for instance_key, instance in yandex_compute_instance.nginx : instance.network_interface.0.nat_ip_address
  ]
}

output "db_instance_external_ip" {
  value = [
    for instance_key, instance in yandex_compute_instance.db : instance.network_interface.0.nat_ip_address
  ]
}

output "app_instance_external_ip" {
  value = [
    for instance_key, instance in yandex_compute_instance.backend : instance.network_interface.0.nat_ip_address
  ]
}
