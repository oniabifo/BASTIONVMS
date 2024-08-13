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

resource "azurerm_virtual_machine_extension" "iis" {
    name                 = "install-iis"
    virtual_machine_id   = azurerm_linux_virtual_machine.virtualmachine.id
    publisher            = "Microsoft.Compute"
    type                 = "CustomScriptExtension"
    type_handler_version = "2.0"
    settings = <<SETTINGS
      { 
        "commandToExecute": "powershell Add-WindowsFeature Web-Asp-Net45;Add-WindowsFeature NET-Framework-45-Core;Add-WindowsFeature Web-Net-Ext45;Add-WindowsFeature Web-ISAPI-Ext;Add-WindowsFeature Web-ISAPI-Filter;Add-WindowsFeature Web-Mgmt-Console;Add-WindowsFeature Web-Scripting-Tools;Add-WindowsFeature Search-Service;Add-WindowsFeature Web-Filtering;Add-WindowsFeature Web-Basic-Auth;Add-WindowsFeature Web-Windows-Auth;Add-WindowsFeature Web-Default-Doc;Add-WindowsFeature Web-Http-Errors;Add-WindowsFeature Web-Static-Content;"
      } 
  SETTINGS
}