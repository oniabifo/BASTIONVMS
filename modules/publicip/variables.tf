variable "resource_group_name" {
  type = string
  default = "clickclaims-rgp-test-0001"

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