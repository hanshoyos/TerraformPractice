variable "pm_api_url" {
  description = "Proxmox API URL"
  type        = string
  default     = "https://proxmox-server01.example.com:8006/api2/json"
}

variable "pm_api_token_id" {
  description = "Proxmox API Token ID"
  type        = string
  default     = "terraform-prov@pve"
}

variable "pm_api_token_secret" {
  description = "Proxmox API Token Secret"
  type        = string
  default     = "secret"
}

variable "pm_tls_insecure" {
  description = "Disable TLS verification"
  type        = bool
  default     = true
}

variable "vm_name" {
  description = "Name of the VM"
  type        = string
  default     = "terraform-test-vm"
}

variable "vm_description" {
  description = "Description of the VM"
  type        = string
  default     = "A test for using Terraform and cloud-init"
}

variable "vm_target_node" {
  description = "Proxmox target node"
  type        = string
  default     = "proxmox-server02"
}

variable "vm_pool" {
  description = "Proxmox resource pool"
  type        = string
  default     = "pool0"
}

variable "vm_template" {
  description = "VM template to clone from"
  type        = string
  default     = "linux-cloudinit-template"
}

variable "vm_cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 2
}

variable "vm_sockets" {
  description = "Number of CPU sockets"
  type        = number
  default     = 1
}

variable "vm_memory" {
  description = "Memory size in MB"
  type        = number
  default     = 2048
}

variable "vm_scsi_hw" {
  description = "SCSI controller type"
  type        = string
  default     = "lsi"
}

variable "vm_disk_size" {
  description = "Disk size in GB"
  type        = number
  default     = 32
}

variable "vm_disk_storage" {
  description = "Storage for the disk"
  type        = string
  default     = "ceph-storage-pool"
}

variable "vm_ip" {
  description = "IP address for the VM"
  type        = string
  default     = "192.168.10.20/24"
}
