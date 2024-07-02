variable "pm_api_url" {
  description = "Proxmox API URL"
  type        = string
  default     = "https://192.168.10.20:8006/api2/json"
}

variable "pm_api_token_id" {
  description = "Proxmox API Token ID"
  type        = string
  default     = "root@pam!Hashicorp"
}

variable "pm_api_token_secret" {
  description = "Proxmox API Token Secret"
  type        = string
  default     = "7c3929a7-7dca-474e-a41f-de89ec3f5950"
}

variable "pm_tls_insecure" {
  description = "Disable TLS verification"
  type        = bool
  default     = true
}

variable "vm_name" {
  description = "Name of the VM"
  type        = string
  default     = "DC01"
}

variable "vm_target_node" {
  description = "Proxmox target node"
  type        = string
  default     = "pve"
}

variable "vm_pool" {
  description = "Proxmox resource pool"
  type        = string
  default     = "Domain_Controllers"
}

variable "vm_template" {
  description = "VM template to clone from"
  type        = string
  default     = "WinServer2019-cloudinit"
}

variable "vm_storage" {
  description = "VM storage"
  type        = string
  default     = "local-zfs"
}

variable "vm_cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 4
}

variable "vm_memory" {
  description = "Amount of memory in MB"
  type        = number
  default     = 4096
}

variable "vm_disk_size" {
  description = "Disk size for the VM"
  type        = string
  default     = "100G"
}
