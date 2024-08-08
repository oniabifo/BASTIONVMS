resource "azurerm_windows_virtual_machine" "virtualmachine" {
  name = var.name
  resource_group_name = var.resource_group_name
  location = var.location
  size = var.size
  admin_username = var.admin_username
  admin_password = var.admin_password
  network_interface_ids = var.network_interface_ids
    availability_set_id = var.availability_set_id == "" ? null : var.availability_set_id
  os_disk {
    caching = var.osdisk.caching
    storage_account_type = var.osdisk.storage_account_type
  }
  source_image_reference {
    publisher = var.source_image_reference.publisher
    offer = var.source_image_reference.offer
    sku = var.source_image_reference.sku
    version = var.source_image_reference.version
  }
  identity {
    type = var.identity.type
  }
}