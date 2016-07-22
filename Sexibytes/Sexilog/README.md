# SexiLog
Recipes for deploying SexiLog.

| Name             | SexiLog                               |
| Editor / Vendor  | SexiBytes                             |
| Website          | http://www.sexilog.fr/                |
| GitHub           | https://github.com/sexibytes/sexilog  |
| Twitter          | https://twitter.com/sexilog_fr        |

## Example

```Powershell
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
```

## Parameters
### Common parameters

| Key           | Type    | Mandatory | Default | Description                                      |
| ------------- | --------| --------- | ------- |------------------------------------------------- |
| FromSource    | String  | True      | None    | Path to the OVF/OVA                              |
| To            | String  | True      | None    | ESXi server where you want to deploy the OVF/OVA |
| Tagged        | String  | False     | None    | Tag used for deployment                          |
| WithOptions   | Hash    | True      | None    | See next paragraph  for more informations        |

### Parameters for the WithOptions hash

| Key                | Type    | Mandatory | Default                                  | Description                                        |
| ------------------ | --------| --------- | ---------------------------------------- |--------------------------------------------------- |
| Name               | String  | True      | None                                     | Name of the virtual machine                        |
| Datastore          | String  | False     | Datastore with the largest free space    | Datastore where the virtual machine will be stored |
| PowerOn            | Bool    | False     | False                                    | Is the virtual machine powered on after deploying  |
| OvfConfiguration   | Hash    | True      | None                                     | See next paragraph  for more informations          |

### Parameters for WithOptions hash

| Key                       | Type    | Mandatory | Default                                  | Description                                        |
| ------------------------- | --------| --------- | ---------------------------------------- |--------------------------------------------------- |
| NetworkMapping.VM Network | String  | False     | None                                     | vSphere Portgroup Network Mapping                  |
