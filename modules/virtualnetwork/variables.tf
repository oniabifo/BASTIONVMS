variable "resource_group_name" {
    description = "Name of the resource group"
    type        = string
}

variable "name" {
    description = "Name of the virtual network"
    type        = string
}

variable "address_space" {
    description = "Address space of the virtual network"
    type        = list(string)
}

variable "location" {
  type = string
  default = "uksouth"
}