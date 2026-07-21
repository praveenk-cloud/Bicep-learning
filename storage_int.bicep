param numberofstorageaccounts int=2

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = [
    for i in range(0, numberofstorageaccounts):{
  name: 'storage${i}swanxa012'
  location: resourceGroup().location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}
]
