variable "connectivityResourceGroupName" {
  type = string
}

variable "location" {
    type = string
    default = "centralus"
}

variable "computeResourceGroupName" {
  type = string
}

variable "connectivityVirtualNetworkName" {
  type = string
}

variable "connectivityVirtualNetworkAddressSpace" {
  type = list(string)
}

variable "computeVirtualNetworkName" {
  type = string
}

variable "computeVirtualNetworkAddressSpace" {
  type = list(string)
}

variable "computeSubnetName" {
  type = string
}

variable "computeSubnetAddressPrefixes" {
  type = list(string)
}

variable "connectivitySubnetName" {
  type = string
}

variable "connectivitySubnetAddressPrefixes" {
  type = list(string)
}

variable "computeVirtualMachineNicIPConfiguration" {
    type = object({
        name = string
        private_ip_address_allocation = string
    })
    default = {
        name = "internal"
        private_ip_address_allocation = "Dynamic"
    }
}

variable "computeVirtualMachineNames" {
    type = list(object({
    name = string
    })) 
}

variable "vmadminusername" {
  type = string
  default = "vmadmin"
}

variable "vmadminpassword" {
  type = string
}

variable "connectivityBastionHostName" {
  type = string
}

variable "connectivityNetworkSecurityGroupName" {
  type = string
}

variable "computeNetworkSecurityGroupName" {
  type = string
}

variable "connectivityNetworkSecurityGroupRules" {
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

variable "computeNetworkSecurityGroupRules" {
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

variable "connectivityBastionHostIpConfiguration" {
    type = object({
        name = string
    })
    default = {
        name = "internal"
    }
}

variable "peerConnectivityToComputeName" {
  type = string
}

variable "peerComputeToConnectivityName" {
  type = string
}