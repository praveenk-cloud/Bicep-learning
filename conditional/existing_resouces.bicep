resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' existing = {
  name: 'stg3mqmlcejyc5xc'
}

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-05-01'={
  name:'stg${uniqueString(resourceGroup().id)}/default/images'}
