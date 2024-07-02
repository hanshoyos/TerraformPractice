terraform {
  required_providers {
    proxmox = {
      source  = "registry.example.com/telmate/proxmox"
      version = ">=1.0.0"
    }
  }
  required_version = ">= 0.14"
}
