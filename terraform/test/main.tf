terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc3"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_tls_insecure     = var.pm_tls_insecure
}

resource "proxmox_vm_qemu" "dc_vm" {
  name        = var.vm_name
  desc        = "A test for using Terraform and cloud-init"
  target_node = var.vm_target_node
  pool        = var.vm_pool
  clone       = var.vm_template
  cores       = var.vm_cores
  agent       = 1
  sockets     = 1
  vcpus       = 0
  os_type     = "cloud-init"
  cpu         = "kvm64"
  memory      = var.vm_memory

  disk {
    size    = var.vm_disk_size
    type    = "scsi"
    storage = var.vm_storage
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  boot       = "order=virtio0"
  ipconfig0  = "ip=192.168.10.100/24,gw=192.168.10.1"

  cicustom = {
    user = "local:snippets/cloud-init.yaml"
  }
}

output "vm_id" {
  description = "The ID of the created VM"
  value       = proxmox_vm_qemu.dc_vm.id
}

output "vm_name" {
  description = "The name of the created VM"
  value       = proxmox_vm_qemu.dc_vm.name
}