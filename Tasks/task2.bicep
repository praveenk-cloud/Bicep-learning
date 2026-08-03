param location string=resourceGroup().location
param VnetName string

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: VnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
  }
}

//NSG

resource webNSG 'Microsoft.Network/networkSecurityGroups@2019-11-01' = {
  name: 'Web-NSG'
  location: location
}

resource appNSG 'Microsoft.Network/networkSecurityGroups@2019-11-01' = {
  name: 'App-NSG'
  location: location
}

resource DBNSG 'Microsoft.Network/networkSecurityGroups@2019-11-01' = {
  name: 'DB-NSG'
  location: location
}

//Subnet

resource websubnet 'Microsoft.Network/virtualNetworks/subnets@2023-05-01'={
  name: '${virtualNetwork.name}/WebSubnet'
  properties:{
    addressPrefix:'10.0.1.0/24'
    networkSecurityGroup:{
      id:webNSG.id
    }
  }
}

resource appsubnet 'Microsoft.Network/virtualNetworks/subnets@2023-05-01'={
  name: '${virtualNetwork.name}/AppSubnet'
  properties:{
    addressPrefix:'10.0.2.0/24'
    networkSecurityGroup:{
      id:appNSG.id
    }
  }
}

resource DBsubnet 'Microsoft.Network/virtualNetworks/subnets@2023-05-01'={
  name: '${virtualNetwork.name}/DBSubnet'
  properties:{
    addressPrefix:'10.0.3.0/24'
    networkSecurityGroup:{
      id:DBNSG.id
    }
  }
}


output WebsubnetID string = websubnet.id
output AppsubnetID string = appsubnet.id
output DBsubnetID string = DBsubnet.id
