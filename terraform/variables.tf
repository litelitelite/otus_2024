variable "service_account_key_file" {
  type        = string
  description = "Yandex Cloud SA key file"
}

variable "cloud_id" {
  type        = string
  description = "Yandex Cloud cloud_id"
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