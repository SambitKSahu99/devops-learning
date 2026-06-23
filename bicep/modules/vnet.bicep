param addressSpace string
param location string
param vnetName string

resource vnet 'Microsoft.Network/virtualNetworks@2025-05-01' = {
    name: vnetName
    location: location

    properties: {
      addressSpace: {
        addressPrefixes: [addressSpace]
      }
    }
}

output vnetName string = vnet.name
