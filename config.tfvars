connectivityResourceGroupName = "clickclaims-connectivity-dev-01"
computeResourceGroupName = "clickclaims-compute-dev-01"
connectivityVirtualNetworkName = "vnet-connectivity-dev-01"
computeVirtualNetworkName = "vnet-compute-dev-01"
connectivityVirtualNetworkAddressSpace = [ "10.1.0.0/16" ]
computeVirtualNetworkAddressSpace = [ "10.2.0.0/16" ]
connectivitySubnetName = "AzureBastionSubnet"
connectivitySubnetAddressPrefixes = [ "10.1.0.0/27" ]
computeSubnetName = "snet-compute-dev-01"
computeSubnetAddressPrefixes = [ "10.2.0.0/26" ]
computeVirtualMachineNames = [ 
    {
        name = "vm-compute-01"
    },
    {
        name = "vm-utility-01"
    }
]
connectivityBastionHostName = "bastion-connectivity-dev-01"
connectivityNetworkSecurityGroupName = "nsg-connectivity-dev-01"
connectivityNetworkSecurityGroupRules = [
  {
    name                     = "AllowHttpsForBastion"
    priority                 = 120
    direction                = "Inbound"
    access                   = "Allow"
    protocol                 = "Tcp"
    source_port_range        = "*"
    destination_port_range   = "443"
    source_address_prefix    = "104.184.163.80"
    destination_address_prefix = "*"
  },
  {
    name                     = "AllowGatewayManagerInbound"
    priority                 = 130
    direction                = "Inbound"
    access                   = "Allow"
    protocol                 = "Tcp"
    source_port_range        = "*"
    destination_port_range   = "443"
    source_address_prefix    = "GatewayManager"
    destination_address_prefix = "*"
  },
  {
    name                     = "AllowAzureLoadBalancerInbound"
    priority                 = 140
    direction                = "Inbound"
    access                   = "Allow"
    protocol                 = "Tcp"
    source_port_range        = "*"
    destination_port_range   = "443"
    source_address_prefix    = "AzureLoadBalancer"
    destination_address_prefix = "*"
  },
  {
    name                     = "AllowBastionHostCommunication"
    priority                 = 150
    direction                = "Inbound"
    access                   = "Allow"
    protocol                 = "*"
    source_port_range        = "*"
    destination_port_ranges   = ["8080","5701"]
    source_address_prefix    = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
  },
  {
    name                     = "DenyAllOtherInbound"
    priority                 = 4000
    direction                = "Inbound"
    access                   = "Deny"
    protocol                 = "*"
    source_port_range        = "*"
    destination_port_range  = "*"
    source_address_prefix    = "*"
    destination_address_prefix = "*"
  },
  {
    name                     = "AllowSshRDPOutbound"
    priority                 = 100
    direction                = "Outbound"
    access                   = "Allow"
    protocol                 = "*"
    source_port_range        = "*"
    destination_port_ranges   = ["22","3389"]
    source_address_prefix    = "*"
    destination_address_prefix = "VirtualNetwork"
  },
  {
    name                     = "AllowAzureCloudOutbound"
    priority                 = 110
    direction                = "Outbound"
    access                   = "Allow"
    protocol                 = "Tcp"
    source_port_range        = "*"
    destination_port_range  = "443"
    source_address_prefix    = "*"
    destination_address_prefix = "AzureCloud"
  },
  {
    name                     = "AllowBastionCommunication"
    priority                 = 120
    direction                = "Outbound"
    access                   = "Allow"
    protocol                 = "*"
    source_port_range        = "*"
    destination_port_ranges   = ["8080","5701"]
    source_address_prefix    = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
  },
  {
    name                     = "AllowHttpOutbound"
    priority                 = 130
    direction                = "Outbound"
    access                   = "Allow"
    protocol                 = "*"
    source_port_range        = "*"
    destination_port_range   = "80"
    source_address_prefix    = "*"
    destination_address_prefix = "Internet"
  }
]
computeNetworkSecurityGroupName = "nsg-compute-01"
computeNetworkSecurityGroupRules = [
  {
    name                     = "AllowBastionInbound"
    priority                 = 100
    direction                = "Inbound"
    access                   = "Allow"
    protocol                 = "Tcp"
    source_port_range        = "*"
    destination_port_ranges  = ["22","3389"]
    source_address_prefix    = "10.1.0.0/27"
    destination_address_prefix = "*"
  },
  {
    name                     = "DenyAllOtherInbound"
    priority                 = 4000
    direction                = "Inbound"
    access                   = "Deny"
    protocol                 = "*"
    source_port_range        = "*"
    destination_port_range  = "*"
    source_address_prefix    = "*"
    destination_address_prefix = "*"
  }
]
peerComputeToConnectivityName = "peer-compute-to-connectivity"
peerConnectivityToComputeName = "peer-connectivity-to-compute"