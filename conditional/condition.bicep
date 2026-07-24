param storagevm bool= true
var location=resourceGroup().location

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' =if (storagevm) {
  name: 'stg${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}

