data "yandex_compute_image" "ubuntu-20-04" {
  family = "ubuntu-2004-lts"
}

locals {
  local_admin_public_key = file(var.local_admin_public_key_path)
}

locals {
  local_admin_private_key = file(var.local_admin_private_key_path)
}

data "yandex_vpc_network" "otus-learning" {
  name = "otus-learning"
}

data "yandex_vpc_subnet" "otus-learning-ru-central1-b" {
  name = "otus-learning-ru-central1-b"
}