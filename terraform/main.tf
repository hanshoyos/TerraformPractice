terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = ">=2.9.7"
    }
  }
}

provider "proxmox" {
  pm_api_url         = "https://192.168.10.20:8006/api2/json"
  pm_api_token_id    = "root@pam!Hashicorp"
  pm_api_token_secret = "7c3929a7-7dca-474e-a41f-de89ec3f5950"
  pm_tls_insecure    = true
}

resource "proxmox_vm_qemu" "dc" {
  name        = "DC01"
  desc        = "Domain Controller"
  target_node = "pve"
  pool        = "pool0"
  clone       = "WinServer2019-cloudinit"
  cores       = 4
  sockets     = 1
  memory      = 8192
  scsihw      = "virtio-scsi-pci"

  disks {
    ide {
      ide3 {
        cloudinit {
          storage = "local-zfs"
        }
      }
    }
    virtio {
      virtio0 {
        disk {
          size            = 60
          cache           = "writeback"
          storage         = "local-zfs"
          iothread        = true
          discard         = true
        }
      }
    }
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  ipconfig0 = "ip=192.168.10.100/24,gw=192.168.10.1"
}
