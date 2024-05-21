output "target_instance_external_ip" {
  value = [
    for instance_key, instance in yandex_compute_instance.iscsi-target : instance.network_interface.0.nat_ip_address
  ]
}

output "initiator_instance_external_ip" {
  value = [
    for instance_key, instance in yandex_compute_instance.iscsi-initiator : instance.network_interface.0.nat_ip_address
  ]
}
