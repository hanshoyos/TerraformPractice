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

  disks {
    ide {
      ide3 {
        cloudinit {
          storage = "local-zfs"
        }
      }
    }
    sata {
      sata0 {
        disk {
          size    = var.vm_disk_size
          storage = var.vm_storage
        }
      }
    }
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
    ip     = "dhcp"
  }
}

##################### OUTPUT BLOCK #####################

output "ansible_inventory" {
  value = templatefile("${path.module}/inventory_hosts.tmpl", {
#    ubuntu_ips = {
#      "monitoring" = proxmox_virtual_environment_vm.vm["monitoring"].ipv4_addresses[1][0]
#    },
    windows_ips = {
      "DCtest"  = proxmox_virtual_environment_vm.vm["DCtest"].ipv4_addresses[0][0]
      #"FS"  = proxmox_virtual_environment_vm.vm["FS"].ipv4_addresses[0][0]
      #"ADCS" = proxmox_virtual_environment_vm.vm["ADCS"].ipv4_addresses[0][0]
      #"WEB" = proxmox_virtual_environment_vm.vm["WEB"].ipv4_addresses[0][0]
      #"WS1" = proxmox_virtual_environment_vm.vm["WS1"].ipv4_addresses[0][0]
      #"WS2" = proxmox_virtual_environment_vm.vm["WS2"].ipv4_addresses[0][0]
    }
  })
}

