resource "yandex_compute_instance" "app1" {

  name        = "app1"
  platform_id = "standard-v3"

  resources {
    cores  = 2
    memory = 4
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

resource "yandex_compute_instance" "app2" {

  name        = "app2"
  platform_id = "standard-v3"

  resources {
    cores  = 2
    memory = 4
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

