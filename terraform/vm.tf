resource "yandex_compute_instance" "nginx" {

  name        = "nginx"
  platform_id = "standard-v3"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      size     = 10
      type     = "network-hdd"
      image_id = data.yandex_compute_image.ubuntu-20-04.id
    }
  }

  network_interface {
    subnet_id = data.yandex_vpc_subnet.otus-learning-ru-central1-b.id
    nat       = true
  }

  metadata = {
    ssh-keys = "${var.local_admin}:${local.local_admin_public_key}}"
  }
  
}

resource "local_file" "ansible_inventory" {
  content = templatefile("inventory.tftmpl",
    {
     ansible_nginx_ip = "${yandex_compute_instance.nginx.network_interface.0.nat_ip_address}"
    }
  )
  filename = "../ansible/inventory"

  provisioner "local-exec" {
    command = "sleep 20 && ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu -i ../ansible/inventory --private-key ${var.local_admin_private_key_path } ../ansible/provision.yml"
  }
}