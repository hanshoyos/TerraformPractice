terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = ">=2.9.0"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_tls_insecure     = var.pm_tls_insecure
}

resource "proxmox_vm_qemu" "example_vm" {
  name        = var.vm_name
  target_node = var.vm_target_node
  pool        = var.vm_pool
  clone       = var.vm_template
  cores       = var.vm_cores
  memory      = var.vm_memory

  disks {
        virtio {
            virtio0 {
                disk {
                    size    = var.vm_disk_size
                    iothread= "virtio"
                    storage = var.vm_disk_size
                }
              }
            }
          }

  network {
    model  = "virtio"
    bridge = "vmbr0"
    # Static IP configuration
    ip = "192.168.10.100/24"
  }

  ipconfig0 = "ip=192.168.10.100/24,gw=192.168.10.1"

  cicustom = "user=local:snippets/cloud-init.yaml"
  # Custom cloud-init configuration
  ciuser_data = file("cloud-init.yaml")
}

output "vm_id" {
  value = proxmox_vm_qemu.example_vm.id
}
