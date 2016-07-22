Deploy 'SexiLog' {
    By vSphereOVF {
        FromSource 'D:\SexiLog.ova'
        To 'esx.example.com'
        Tagged 'Prod'
        WithOptions @{
            Name = 'SEXILOG'
            Datastore = 'DATASTORE01'
            OvfConfiguration = @{
                'NetworkMapping.VM Network' = 'Supervision'
            }
            PowerOn = $true
        }
    }
}

