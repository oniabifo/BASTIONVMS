output "identity" {
  value = azurerm_windows_virtual_machine.virtualmachine.identity
}

output "object_id" {
  value = azurerm_windows_virtual_machine.virtualmachine.identity[0].principal_id
}