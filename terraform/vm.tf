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
      image_id = data.yandex_compute_image.almalinux-9.id
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
  
resource "yandex_compute_instance" "backend" {
  for_each    = var.yc_compute_instances_backend
  name        = each.value.name
  platform_id = each.value.platform_id

  depends_on = [
    yandex_compute_instance.nginx
  ]

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
    subnet_id = "${yandex_vpc_subnet.otus-learning-ru-central1-b.id}"
    nat       = each.value.nat
    ip_address = each.value.ip_address

  }

  metadata = {
    ssh-keys = "${var.local_admin}:${local.local_admin_public_key}}"
  }
  
}

resource "yandex_compute_instance" "db" {
  for_each    = var.yc_compute_instances_db
  name        = each.value.name
  platform_id = each.value.platform_id

  depends_on = [
    yandex_compute_instance.backend
  ]
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
    subnet_id = "${yandex_vpc_subnet.otus-learning-ru-central1-b.id}"
    nat       = each.value.nat
    ip_address = each.value.ip_address
  }

  metadata = {
    ssh-keys = "${var.local_admin}:${local.local_admin_public_key}}"
  }
  
}

resource "yandex_compute_instance" "iscsi" {
  for_each    = var.yc_compute_instances_iscsi
  name        = each.value.name
  platform_id = each.value.platform_id

  depends_on = [
    yandex_compute_instance.db
  ]
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
    subnet_id = "${yandex_vpc_subnet.otus-learning-ru-central1-b.id}"
    nat       = each.value.nat
    ip_address = each.value.ip_address
  }
  secondary_disk {
      disk_id =  "${yandex_compute_disk.iscsi-disk.id}"
      device_name = "vdb"
    }
  
  metadata = {
    ssh-keys = "${var.local_admin}:${local.local_admin_public_key}}"
  }
  
}