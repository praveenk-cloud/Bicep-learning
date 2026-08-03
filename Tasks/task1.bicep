param location string=resourceGroup().location
param storageaccountName string

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageaccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
   properties:{
    minimumTlsVersion:'TLS1_2'
    supportsHttpsTrafficOnly: true
    allowBlobPublicAccess: false
   }

}


resource blobservice 'Microsoft.Storage/storageAccounts/blobServices@2023-05-01'={
  parent: storageaccount
  name:'default'
} 

resource blobcontainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-05-01'  = {
  name: 'newcontainer'
  parent:blobservice
}

resource fileservice 'Microsoft.Storage/storageAccounts/fileServices@2023-05-01' = {
  name: 'default'
parent:storageaccount
}

resource fileshatre 'Microsoft.Storage/storageAccounts/fileServices/shares@2023-05-01'={
  name: 'fileshare'
  parent:fileservice
}

