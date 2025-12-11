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

variable "ubuntu_vm_count" {
  type    = number
  default = 3
}

variable "ubuntu_vm_size" {
  type    = number
  default = 5
}

variable "ubuntu_vm_memory" {
  type    = number
  default = 1
}

variable "ubuntu_vm_cores" {
  type    = number
  default = 1
}
