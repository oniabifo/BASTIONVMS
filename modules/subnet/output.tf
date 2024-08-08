output "id" {
  description = "ID of the Subnet"
  value = azurerm_subnet.subnet.id
}

output "name" {
  description = "Name of the Subnet"
  value = azurerm_subnet.subnet.name
}