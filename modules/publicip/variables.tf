variable "resource_group_name" {
  type = string

}

variable "name" {
  type = string
}

variable "sku" {
  type = string
  default = "Standard"
}

variable "allocation_method" {
  type = string
  default = "Static"
}

variable "location" {
  type = string
  default = "uksouth"
}