param enablebackup bool = false

resource backupvault 'Microsoft.RecoveryServices/vaults@2026-05-01'=if (enablebackup){
  name: 'RSVswan'
  location:resourceGroup().location
}

