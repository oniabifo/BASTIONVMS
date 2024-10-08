variable "name" {
    type = string
}

variable "resource_group_name" {
    type = string

}

variable "virtual_network_name" {
    type = string
}

variable "address_prefixes" {
    type = list(string)
}

variable "service_endpoints" {
  type = list(string)
  default = []
}

variable "location" {
  type = string
  default = "uksouth"
}