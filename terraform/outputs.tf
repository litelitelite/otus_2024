output "gfs2_external_ip" {
  value = [
    for instance_key, instance in yandex_compute_instance.gfs2-node : instance.network_interface.0.nat_ip_address
  ]
}

output "gfs2_master_external_ip" {
  value = [
    for instance_key, instance in yandex_compute_instance.gfs2-node-master : instance.network_interface.0.nat_ip_address
  ]
}