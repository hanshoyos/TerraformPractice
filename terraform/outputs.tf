output "vm_id" {
  description = "ID of the VM"
  value       = proxmox_vm_qemu.dc.id
}

output "vm_name" {
  description = "Name of the VM"
  value       = proxmox_vm_qemu.dc.name
}

output "vm_ip" {
  description = "IP address of the VM"
  value       = var.vm_ip
}
