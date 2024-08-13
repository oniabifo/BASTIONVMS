variable "resource_group_name" {
  description = "Name of the resource group to deploy the Virtual Machine into"
  type = string

}

variable "name" {
  description = "Name of the Virtual Machine"
  type = string
}

variable "location" {
  description = "Location of the Virtual Machine"
  type = string
  default = "uksouth"
}

variable "size" {
  description = "Size of the Virtual Machine"
  type = string
  default = "Standard_B2ms"
}

variable "admin_username" {
  description = "Admin username for the Virtual Machine"
  type = string
}

variable "admin_password" {
  description = "Admin password for the Virtual Machine"
  type = string
}

variable "network_interface_ids" {
  description = "Network Interface IDs for the Virtual Machine"
  type = list(string)
}

variable "osdisk" {
  description = "OS Disk configuration for the Virtual Machine"
  type = object({
    caching = string
    storage_account_type = string
  })
  default = {
    caching = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }
}

variable "source_image_reference" {
  description = "Source Image Reference for the Virtual Machine"
  type = object({
    publisher = string
    offer = string
    sku = string
    version = string
  })
  default = {
    publisher = "MicrosoftWindowsServer"
    offer = "WindowsServer"
    sku = "2022-datacenter-g2"
    version = "latest"
  }
}

variable "availability_set_id" {
  description = "ID of the Availability Set to deploy the Virtual Machine into"
  type = string
  default = ""
}

variable "identity" {
  description = "Identity configuration for the Virtual Machine"
  type = object({
    type = string
  })
  default = {
    type = "SystemAssigned"
  }
}