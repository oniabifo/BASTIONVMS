output "id" {
  value = azurerm_network_interface.networkinterface.id
}

output "ipconfigurationname" {
    value = azurerm_network_interface.networkinterface.ip_configuration[0].name
}