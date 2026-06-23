targetScope = 'resourceGroup'

@allowed(['dev'
  'qa'
  'prod'
])
param environment string

param tenant string

param location string = resourceGroup().location

var resourcePrefix = '${environment}-${tenant}'

module vnet 'modules/vnet.bicep' = {
  name: 'vnet-deploy'
  params:{
    vnetName: '${resourcePrefix}-vnet'
    location: location
    addressSpace: '10.0.0.0/28'
  }
}

module subnet 'moules/subnet.bicep' = {
  name: 'subnet-deploy'
  params:{
    subNetName: '${resourcePrefix}-subnet'
    vnetName: vnet.outputs.vnetName
    addressPrefix: '10.0.0.0/29'
  }
}
