param subNetName string
param vnetName string
param addressPrefix string

resource vnet 'Microsoft.Network/virtualNetworks@2025-05-01' existing = {
  name: vnetName
}

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2025-05-01' = {
    parent: vnet
    name: subNetName

    properties: {
        addressPrefix: addressPrefix
    }
}

output subNetId string  = subnet.id
output subNetName string = subnet.name
