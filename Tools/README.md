# Tools
Collection of scripts for helping creating PSDeploy recipes

### Get-OvfKeys

This script is used to easely find all the available advanced properties of an OVF/OVA. 

```Powershell
PowerCLI D:\> Get-OvfConfiguration -Ovf 'D:\sexigraf.ova'
PowerCLI D:\> $OvfConfiguration | .\Get-OvfKeys.ps1

'guestinfo.dns' = ''
'guestinfo.domain' = ''
'guestinfo.gateway' = ''
'guestinfo.hostname' = ''
'guestinfo.ipaddress' = ''
'guestinfo.netmask' = ''
'NetworkMapping.VM Network' = ''
```

### Format-OvfKeysMarkdown

This script is used to output OvfConfiguration keys in a markdown table format style.

```Powershell
PowerCLI D:\> Get-OvfConfiguration -Ovf 'D:\nested_esxi_appliance_v6.0u2.ova'
PowerCLI D:\> $OvfConfiguration | .\Format-OvfKeysMarkdown.ps1

| Key                         | Type    | Mandatory | Default                                  | Description                                        |
| -------------------------   | --------| --------- | ---------------------------------------- |--------------------------------------------------- |
| `guestinfo.createvmfs` | boolean | | None | Automatically create local VMFS Datastore (datastore1) |
| `guestinfo.dns` | string | | None | DNS Server |
| `guestinfo.domain` | string | | None | DNS Domain |
| `guestinfo.gateway` | string | | None | Gateway of vmk0 |
| `guestinfo.hostname` | string | | None | ESXi Hostname |
| `guestinfo.ipaddress` | string | | None | IP Address of vmk0 |
| `guestinfo.netmask` | string | | None | Netmask of vmk0 |
| `guestinfo.ntp` | string | | None | NTP Server |
| `guestinfo.password` | password | | None | ESXi Root Password |
| `guestinfo.ssh` | boolean | | None | Enable SSH |
| `guestinfo.syslog` | string | | None | Syslog Server |
| `NetworkMapping.VM Network` | string | | None | The VM Network network |
```





