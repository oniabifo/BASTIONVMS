variable "resource_group_name" {
  type = string
  description = "The name of the resource group in which to create the virtual network peering."
  default = "clickclaims-rgp-test-0001"

}

variable "name" {
  type = string
  description = "Name of the virtual network peer."
}

variable "virtual_network_name" {
  type = string
  description = "The full Azure resource ID of the remote virtual network."
}

variable "remote_virtual_network_id" {
  type = string
  description = "The resource ID of the virtual network the peering it to."
}

variable "allow_forwarded_traffic" {
  type = bool
  default = false
  description = "Allow forwarded traffic from another vNet via the source vNet"
}

variable "allow_virtual_network_access" {
  type = bool
  default = true
  description = "Allow virtual network access from the source Virtual Network to the Destination Virtual Network"
}

variable "allow_gateway_transit" {
  type = bool
  default = false
  description = "Allow destination vNets to use Virtual Network Gateways to transit traffic."
}

variable "use_remote_gateways" {
  type = bool
  default = false
  description = "Allow the destination vNet to use the virtual network gateways in the source vNet"
}