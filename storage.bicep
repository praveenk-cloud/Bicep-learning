 param storage string

  resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
    name: storage
    location: resourceGroup().location
    kind: 'StorageV2'
    sku: {
      name: 'Premium_LRS'
    }
  }
