targetScope = 'resourceGroup'

@allowed(['dev'
  'qa'
  'stg'
])
param environment string
param tenant string
param location string = resourceGroup().location
@secure()
param adminPassword string

var resourcePrefix = '${environment}-${tenant}'

module vnet 'modules/vnet.bicep' = {
  name: 'vnet-deploy'
  params:{
    vnetName: '${resourcePrefix}-vnet'
    location: location
    addressSpace: '10.0.0.0/28'
  }
}

module subnet 'modules/subnet.bicep' = {
  name: 'subnet-deploy'
  params:{
    subNetName: '${resourcePrefix}-subnet'
    vnetName: vnet.outputs.vnetName
    addressPrefix: '10.0.0.0/29'
  }
}

module vm 'modules/vm.bicep' = {
  name: 'depoy-vm'
  params: {
    vmName: '${resourcePrefix}-vm'
    location: location
    subnetId: subnet.outputs.subNetId
    adminUsername: 'admin'
    adminPassoword: adminPassword
  }
}
