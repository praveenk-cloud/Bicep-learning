param subnetNames array= [
  'frontend'
  'backend'
]

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: 'Vnet1'
  location: resourceGroup().location
  
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    
    subnets: [
      for (name,i) in subnetNames:{
        name: name
        properties: {
          addressPrefix: i==0 ? '10.0.0.0/24' : '10.0.1.0/24'
        }
      }
    ]
  }
}
