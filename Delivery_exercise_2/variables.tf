variable "proxmox_password" {
  type      = string
  sensitive = true
}

variable "proxmox_username" {
  type = string
}

variable "proxmox_url" {
  type = string
}

variable "ubuntu_vm_password" {
  type      = string
  sensitive = true
}

variable "ubuntu_vm_username" {
  type    = string
  default = "ubuntu"
}

variable "proxmox_node_name" {
  type = string
}
