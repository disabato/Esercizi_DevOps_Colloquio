terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~>0.89.1"
    }
  }
}

provider "proxmox" {
  endpoint = var.proxmox_url
  username = var.proxmox_username
  password = var.proxmox_password
  insecure = true
}





resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
  name            = "test-ubuntu-${count.index}"
  description     = "Test Ubuntu VM"
  node_name       = var.proxmox_node_name
  count           = var.ubuntu_vm_count
  stop_on_destroy = true

  initialization {
    user_account {
      username = var.ubuntu_vm_username
      password = var.ubuntu_vm_password
    }
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }

  cpu {
    cores = var.ubuntu_vm_cores
  }

  memory {
    dedicated = var.ubuntu_vm_memory * 1024
  }

  disk {
    import_from = proxmox_virtual_environment_download_file.ubuntu_cloud_image.id
    interface   = "virtio0"
    size        = var.ubuntu_vm_size
  }
}

resource "proxmox_virtual_environment_download_file" "ubuntu_cloud_image" {
  content_type = "import"
  datastore_id = "local"
  node_name    = var.proxmox_node_name
  url          = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
  file_name    = "ubuntu-jammy-server-cloudimg-amd64.qcow2"
}
