variable "service_account_key_file" {
  type        = string
  description = "Yandex Cloud SA key file"
}

variable "cloud_id" {
  type        = string
  description = "Yandex Cloud cloud_id"
}

variable "image_id" {
  type        = string
  description = "Yandex Cloud image_id"
  default     = "fd83m7rp3r4l12c2keph"
}

variable "folder_id" {
  type        = string
  description = "Yandex Cloud folder_id"
}

variable "yc_zone" {
  type        = string
  description = "Yandex Cloud compute default zone"
  default     = "ru-central1-b"
}

variable "local_admin_private_key_path" {
  type        = string
  description = "Private key path"
}

variable "local_admin_public_key_path" {
  type        = string
  description = "Public key path"
}

variable "local_admin" {
  type        = string
  description = "Local admin name"
}


variable "yc_compute_instances_backend" {
    type = map(object({
    name        = string
    platform_id = string
    cores       = number
    memory      = number
    size        = number
    type        = string
    nat         = bool
    ip_address  = string
  }))
}


variable "yc_compute_instances_nginx" {
    type = map(object({
    name        = string
    platform_id = string
    cores       = number
    memory      = number
    size        = number
    type        = string
    nat         = bool
    ip_address  = string
  }))
}


variable "yc_compute_instances_db" {
    type = map(object({
    name        = string
    platform_id = string
    cores       = number
    memory      = number
    size        = number
    type        = string
    nat         = bool
    ip_address  = string
  }))
}

variable "yc_compute_instances_elk" {
    type = map(object({
    name        = string
    platform_id = string
    cores       = number
    memory      = number
    size        = number
    type        = string
    nat         = bool
    ip_address  = string
  }))
}

variable "otus_network_name" {
  type = string
  default = "otus-learning" ## Provide your network name
}

variable "otus_subnet_name" {
  type = string
  default = "otus-learning-ru-central1-b" ## Provide your subnet name
}