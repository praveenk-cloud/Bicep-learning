param storagecount int=3
var location=resourceGroup().location

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' =[
  for i in range(0, storagecount):{
  name: 'stor${uniqueString(resourceGroup().id)}${i}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}
]
