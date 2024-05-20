resource "local_file" "ansible_inventory" {
  content = templatefile("inventory.tftmpl",
    {
        ansible_nginx_ip = "${yandex_compute_instance.nginx.network_interface.0.nat_ip_address}"
        ansible_db_ip = "${yandex_compute_instance.db.network_interface.0.nat_ip_address}"
        ansible_app1_ip = "${yandex_compute_instance.app1.network_interface.0.nat_ip_address}"
        ansible_app2_ip = "${yandex_compute_instance.app2.network_interface.0.nat_ip_address}"    
    }
  )
  filename = "../ansible/inventory"

  provisioner "local-exec" {
    command = "sleep 20 && ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu -i ../ansible/inventory --private-key ${var.local_admin_private_key_path } ../ansible/site.yml"
  }
}