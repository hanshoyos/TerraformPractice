output "vm_id" {
  description = "The ID of the created VM"
  value       = proxmox_vm_qemu.example_vm.id
}

output "vm_name" {
  description = "The name of the created VM"
  value       = proxmox_vm_qemu.example_vm.name
}
