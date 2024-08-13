variable "resource_group_name" {
  description = "Name of the resource group to deploy the Network Security Group into"
  type = string
}

variable "location" {
  type = string
}

variable "name" {
  description = "Name of the Network Security Group"
  type = string
}

variable "security_rules" {
  description = "List of security rules"
  type = list(object({
    name                     = string
    priority                 = number
    direction                = string
    access                   = string
    protocol                 = string
    source_port_range        = string
    destination_port_range   = optional(string)
    destination_port_ranges = optional(list(string))
    source_address_prefix    = string
    destination_address_prefix = string
  }))
  
}