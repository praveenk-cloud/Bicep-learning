param storageconfigure object={
  kind: 'StorageV2'
  sku: 'Standard_LRS'
}

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: 'swannamestorag000'
  location: resourceGroup().location
  kind: storageconfigure.kind
  sku: {
    name: storageconfigure.sku
  }
}
