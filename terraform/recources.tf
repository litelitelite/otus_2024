
resource "yandex_compute_disk" "iscsi-disk" {
  name       = "iscsi-disk"
  type       = "network-hdd"
  zone       = var.yc_zone
  size       = 5
}

resource "local_file" "ansible_inventory" {
  content = templatefile("inventory.tftmpl", {
    gfs2_external_ip = [
      for instance_key, instance in yandex_compute_instance.gfs2-node : instance.network_interface.0.nat_ip_address
    ]
    gfs2_master_external_ip = [
      for instance_key, instance in yandex_compute_instance.gfs2-node-master : instance.network_interface.0.nat_ip_address
    ]
  })

  filename = "../ansible/inventory"

  # provisioner "local-exec" {
  #   command = "sleep 20 && ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu -i ../ansible/inventory --private-key ${var.local_admin_private_key_path } ../ansible/site.yml"
  # }
}

