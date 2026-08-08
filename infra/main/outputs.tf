output "resource_group_name" {
  value = azurerm_resource_group.rg_main.name
}

output "vm_public_ip" {
  value = module.vm.public_ip_address
}

output "vm_name" {
  value = module.vm.vm_name
}

output "nsg_name" {
  value = module.networking.nsg_name
}

output "key_vault_name" {
  value = module.key_vault.key_vault_name
}

output "ssh_private_key_secret_name" {
  value = azurerm_key_vault_secret.ssh_private_key.name
}