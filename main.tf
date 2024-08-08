resource "azurerm_resource_group" "connectivityResourceGroup" {
  name = var.connectivityResourceGroupName
  location = var.location
}

resource "azurerm_resource_group" "computeResourceGroup" {
  name = var.computeResourceGroupName
  location = var.location
}

module "connectivityVirtualNetwork" {
  source = "./modules/virtualnetwork"
  name = var.connectivityVirtualNetworkName
  resource_group_name = azurerm_resource_group.connectivityResourceGroup.name
  address_space = var.connectivityVirtualNetworkAddressSpace
  location = azurerm_resource_group.connectivityResourceGroup.location
}

module "computeVirtualNetwork" {
  source = "./modules/virtualnetwork"
  name = var.computeVirtualNetworkName
  resource_group_name = azurerm_resource_group.computeResourceGroup.name
  address_space = var.computeVirtualNetworkAddressSpace
  location = azurerm_resource_group.computeResourceGroup.location
}


module "connectivitySubnet" {
  source = "./modules/subnet"
  name = var.connectivitySubnetName
  resource_group_name = azurerm_resource_group.connectivityResourceGroup.name
  virtual_network_name = module.connectivityVirtualNetwork.virtual_network_name
  address_prefixes = var.connectivitySubnetAddressPrefixes
  location = azurerm_resource_group.connectivityResourceGroup.location
}

module "computeSubnet" {
  source = "./modules/subnet"
  name = var.computeSubnetName
  resource_group_name = azurerm_resource_group.computeResourceGroup.name
  virtual_network_name = module.computeVirtualNetwork.virtual_network_name
  address_prefixes = var.computeSubnetAddressPrefixes
  location = azurerm_resource_group.computeResourceGroup.location
}

module "computeVirtualMachinesNic" {
  source = "./modules/networkinterface"
  count = length(var.computeVirtualMachineNames)
  name = "nic-${var.computeVirtualMachineNames[count.index].name}"
  subnet_id = module.computeSubnet.id
  resource_group_name = azurerm_resource_group.computeResourceGroup.name
  location = azurerm_resource_group.computeResourceGroup.location
  ip_configuration = var.computeVirtualMachineNicIPConfiguration
}

module "computeVirtualMachines" {
  source = "./modules/virtualmachine"
  count = length(var.computeVirtualMachineNames)
  name = var.computeVirtualMachineNames[count.index].name
  location = azurerm_resource_group.computeResourceGroup.location
  network_interface_ids = ["${element(module.computeVirtualMachinesNic.*.id, count.index)}"]
  admin_username = var.vmadminusername
  admin_password = var.vmadminpassword
  resource_group_name = azurerm_resource_group.computeResourceGroup.name
}

module "connectivityBastionHostPublicIp" {
  source = "./modules/publicip"
  name = "pip-${var.connectivityBastionHostName}"
  resource_group_name = azurerm_resource_group.connectivityResourceGroup.name
  location = azurerm_resource_group.connectivityResourceGroup.location
}

module "connectivityBastionHost" {
  source = "./modules/bastion"
  name = var.connectivityBastionHostName
  subnet_id = module.connectivitySubnet.id
  resource_group_name = azurerm_resource_group.connectivityResourceGroup.name
  location = azurerm_resource_group.connectivityResourceGroup.location
  virtual_network_name = module.connectivityVirtualNetwork.virtual_network_name
  public_ip_address_id = module.connectivityBastionHostPublicIp.id
  ip_configuration = var.connectivityBastionHostIpConfiguration
  tunneling_enabled = true // this allows connectivity from the RDP client using CMD
}

module "connectivityNetworkSecurityGroup" {
  source = "./modules/networksecuritygroup"
  resource_group_name = azurerm_resource_group.connectivityResourceGroup.name
  location = azurerm_resource_group.connectivityResourceGroup.location
  name = var.connectivityNetworkSecurityGroupName
  security_rules = var.connectivityNetworkSecurityGroupRules
}

module "computeNetworkSecurityGroup" {
  source = "./modules/networksecuritygroup"
  resource_group_name = azurerm_resource_group.computeResourceGroup.name
  location = azurerm_resource_group.computeResourceGroup.location
  name = var.computeNetworkSecurityGroupName
  security_rules = var.computeNetworkSecurityGroupRules
}

module "peerConnectivityToCompute" {
  source = "./modules/virtualnetworkpeering"
  resource_group_name = azurerm_resource_group.connectivityResourceGroup.name
  name = var.peerConnectivityToComputeName
  virtual_network_name = module.connectivityVirtualNetwork.virtual_network_name
  remote_virtual_network_id = module.computeVirtualNetwork.virtual_network_id
}

module "peerComputeToConnectivity" {
  source = "./modules/virtualnetworkpeering"
  resource_group_name = azurerm_resource_group.computeResourceGroup.name
  name = var.peerComputeToConnectivityName
  virtual_network_name = module.computeVirtualNetwork.virtual_network_name
  remote_virtual_network_id = module.connectivityVirtualNetwork.virtual_network_id
}