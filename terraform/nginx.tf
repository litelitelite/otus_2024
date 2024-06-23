resource "yandex_compute_instance" "nginx" {
  for_each    = var.yc_compute_instances_nginx
  name        = each.value.name
  platform_id = each.value.platform_id

  resources {
    cores  = each.value.cores
    memory = each.value.memory
  }

  boot_disk {
    initialize_params {
      size     = each.value.size
      type     = each.value.type
      image_id = data.yandex_compute_image.ubuntu-20-04.id
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.otus-learning-ru-central1-b.id}"
    nat       = each.value.nat
    ip_address = each.value.ip_address
  }

  metadata = {
    ssh-keys = "${var.local_admin}:${local.local_admin_public_key}}"
  }
  
}
  