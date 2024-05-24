resource "yandex_compute_instance" "gfs2-node" {
  for_each    = var.yc_compute_instances
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
      image_id = data.yandex_compute_image.almalinux-9.id
    }
  }

  network_interface {
    subnet_id = data.yandex_vpc_subnet.otus-learning-ru-central1-b.id
    nat       = each.value.nat
    ip_address = each.value.ip_address
  }

  metadata = {
    ssh-keys = "${var.local_admin}:${local.local_admin_public_key}}"
  }
  
}
  
resource "yandex_compute_instance" "gfs2-node-master" {
  for_each    = var.yc_compute_instances_master
  name        = each.value.name
  platform_id = each.value.platform_id

  resources {
    cores  = each.value.cores
    memory = each.value.memory
  }

  secondary_disk {
      disk_id =  "${yandex_compute_disk.iscsi-disk.id}"
      device_name = "vdb"
    }
  boot_disk {
    initialize_params {
      size     = each.value.size
      type     = each.value.type
      image_id = data.yandex_compute_image.almalinux-9.id
    }
  }

  network_interface {
    subnet_id = data.yandex_vpc_subnet.otus-learning-ru-central1-b.id
    nat       = each.value.nat
  }

  metadata = {
    ssh-keys = "${var.local_admin}:${local.local_admin_public_key}}"
  }
  
}
  