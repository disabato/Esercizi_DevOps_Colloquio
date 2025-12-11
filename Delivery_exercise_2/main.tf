terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.89.1"
    }
  }
}

provider "proxmox" {
    endpoint = var.proxmox_url
    username = var.proxmox_username
    password = var.proxmox_password
    insecure = true
}

