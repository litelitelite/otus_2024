locals {
  local_admin_public_key = file(var.local_admin_public_key_path)
}

locals {
  local_admin_private_key = file(var.local_admin_private_key_path)
}
