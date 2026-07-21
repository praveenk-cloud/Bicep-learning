resource virtualMachine 'Microsoft.Compute/virtualMachines@2020-12-01' = {
  name: 'Vm1'
  location: resourceGroup().location
}

resource linuxVMExtensions 'Microsoft.Compute/virtualMachines/extensions@2019-07-01' = {
  parent: virtualMachine
  name: 'Vm1'
  location: resourceGroup().location
  properties: {
    publisher: 'Microsoft.Azure.Extensions'
    type: 'CustomScript'
    typeHandlerVersion: '2.1'
    autoUpgradeMinorVersion: true
    settings: {
      fileUris: [
        'fileUris'
      ]
    }
    protectedSettings: {
      commandToExecute: 'sh customScript.sh'
    }
  }
}

