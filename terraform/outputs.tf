output "db_external_ip" {
  value = [
    for instance_key, instance in yandex_compute_instance.db : instance.network_interface.0.nat_ip_address
  ]
}

output "backend_external_ip" {
  value = [
    for instance_key, instance in yandex_compute_instance.backend : instance.network_interface.0.nat_ip_address
  ]
}

output "nginx_external_ip" {
  value = [
    for instance_key, instance in yandex_compute_instance.nginx : instance.network_interface.0.nat_ip_address
  ]
}

output "iscsi_external_ip" {
  value = [
    for instance_key, instance in yandex_compute_instance.iscsi : instance.network_interface.0.nat_ip_address
  ]
}