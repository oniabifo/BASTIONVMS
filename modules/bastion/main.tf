resource "azurerm_bastion_host" "bastion" {
  name = var.name
  location = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name = var.ip_configuration.name
    subnet_id = var.subnet_id
    public_ip_address_id = var.public_ip_address_id
  }
  sku = var.sku
  tunneling_enabled = var.tunneling_enabled
}