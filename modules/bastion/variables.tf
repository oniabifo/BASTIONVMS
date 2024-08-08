variable "resource_group_name" {
  type = string
  default = "clickclaims-rgp-test-0001"
}
variable "virtual_network_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "public_ip_address_id" {
  type = string
}

variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "ip_configuration" {
  description = "IP Configuration for the Network Interface"
  type = object({
    name = string
  })
}

variable "sku" {
  type = string
  default = "Standard"
}

variable "tunneling_enabled" {
  type = bool
  default = false
}