# Sexigraf
Recipes for deploying Sexigraf.

| Name             | Sexigraf                              |
| Editor / Vendor  | SexiBytes                             |
| Website          | http://www.sexigraf.fr/               |
| GitHub           | https://github.com/sexibytes/sexigraf |
| Twitter          | https://twitter.com/sexigraf_fr       |

## Example

```Powershell
Deploy 'SexiGraf' {
    By vSphereOVF {
        FromSource 'D:\sexigraf.ova'
        To 'esxi.example.com'
        Tagged 'Prod'
        WithOptions @{
            Name = 'SEXIGRAF'
            Datastore = 'DATASTORE01'
            OvfConfiguration = @{
                'NetworkMapping.VM Network' = 'Production'
                'guestinfo.hostname'        = 'sexigraf.example.com' #GuestOS Hostname
                'guestinfo.ipaddress'       = '192.168.1.1' #IP Address of eth0 (DHCP if empty)
                'guestinfo.netmask'         = '255.255.255.0' #Netmask of eth0
                'guestinfo.gateway'         = '192.168.1.254' #Gateway of eth0
                'guestinfo.dns'             = '192.168.1.10 192.168.1.11' #DNS servers (optional - separated by space)
                'guestinfo.domain'          = 'example.com' #DNS domains lookup (optional - separated by space)
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
| guestinfo.hostname        | String  | False     | None                                     | GuestOS Hostname                                   |
| guestinfo.ipaddress       | String  | False     | DHCP                                     | IP Address of eth0 (DHCP if empty)                 |
| guestinfo.netmask         | String  | False     | None                                     | Netmask of eth0                                    |
| guestinfo.gateway         | String  | False     | None                                     | Gateway of eth0                                    |
| guestinfo.dns             | String  | False     | None                                     | DNS servers (optional - separated by space)        |
| guestinfo.domain          | String  | False     | None                                     | DNS domains lookup (optional - separated by space) |
