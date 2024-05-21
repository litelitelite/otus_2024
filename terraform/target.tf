resource "yandex_compute_instance" "iscsi-target" {
    for_each    = var.yc_compute_instances_target
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

    secondary_disk {
      disk_id =  "${yandex_compute_disk.iscsi-disk.id}"
    }

    network_interface {
      subnet_id = data.yandex_vpc_subnet.otus-learning-ru-central1-b.id
      nat       = each.value.nat
    }

    metadata = {
      ssh-keys = "${var.local_admin}:${local.local_admin_public_key}}"
    }
  
}