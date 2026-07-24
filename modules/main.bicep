param location string= resourceGroup().location

module storage './storage.bicep'={
  name:'storagedeployment'
 params:{
    location:location
    storagename: 'stg${uniqueString(resourceGroup().id)}'
  
  }


}

