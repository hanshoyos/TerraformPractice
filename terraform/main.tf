terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = ">=2.9.7"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_tls_insecure     = var.pm_tls_insecure
}

resource "proxmox_vm_qemu" "dc" {
  name        = var.vm_name
  desc        = var.vm_description
  target_node = var.vm_target_node
  pool        = var.vm_pool
  clone       = var.vm_template
  cores       = var.vm_cores
  sockets     = var.vm_sockets
  memory      = var.vm_memory
  scsihw      = var.vm_scsi_hw

  disk {
    id           = 0
    size         = "${var.vm_disk_size}G"
    storage      = var.vm_disk_storage
    type         = "virtio"
    cache        = "writeback"
    iothread     = true
    discard      = true
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  ipconfig0 = "ip=${var.vm_ip},gw=${var.vm_gateway}"

  sshkeys = <<EOF
ssh-rsa 9182739187293817293817293871== user@pc
EOF
}
