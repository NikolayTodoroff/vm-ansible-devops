output "public_ip_address" {
  value = azurerm_public_ip.main.ip_address
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.main.name
}

output "vm_id" {
  value = azurerm_linux_virtual_machine.main.id
}

output "identity_principal_id" {
  value = azurerm_linux_virtual_machine.main.identity[0].principal_id
}

output "admin_username" {
  value = var.admin_username
}

output "private_key_pem" {
  value     = tls_private_key.ssh.private_key_pem
  sensitive = true
}