variable "resource_group_name" {
  description = "Name of the resource group for the virtual network"
  type = string
}

variable "location" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "name" {
  description = "Network Interface Name"
  type = string
}

variable "ip_configuration" {
  description = "IP Configuration for the Network Interface"
  type = object({
    name = string
    private_ip_address_allocation = string
  })
}