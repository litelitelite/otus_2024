variable "proxmox_api_url" {
  default = "https://<cluster_or_node_ip>:8006/api2/json"
}

variable "proxmox_api_token_id" {
  default = "<api_token_id>"
}

variable "proxmox_api_token_secret" {
  default = "<api_token_proxmox>"
}

variable "ssh_key" {
  default = "<pub_ssh_key>"
}

variable "virtual_machines" {
  default = {
    "otus-test-01" = {
      hostname    = "otus-test-01",
      ip_address  = "192.168.10.2/24",
      gateway     = "192.168.10.1",
      target_node = "<proxmox_node_name>",
      cpu_cores   = 2,
      cpu_sockets = 1,
      memory      = "1024",
      hdd_size    = "5G",
      vm_template = "<vm_template_name>",
      ciuser      = "<vm_username>",
      cipassword  = "<vm_password>",
    },
    "tf-test-02" = {
      hostname    = "tf-test-02",
      ip_address  = "192.168.10.3/24",
      gateway     = "192.168.10.1",
      target_node = "<proxmox_node_name>",
      cpu_cores   = 2,
      cpu_sockets = 1,
      memory      = "1024",
      hdd_size    = "5G",
      vm_template = "<vm_template_name>",
      ciuser      = "<vm_username>",
      cipassword  = "<vm_password>",
    },
  }
}