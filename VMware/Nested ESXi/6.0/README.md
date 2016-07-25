# Nested ESXi
Recipes for deploying Nested ESXi 6.0

# PSDeploy-vSphereOVF-Recipes
Library of recipes for deploying Vmware vCenter Server Appliance 6.0

| Key              | Value                                 |
| ---------------- | ------------------------------------- |
| Name             | ESXi                                  |
| Editor / Vendor  | VMware                                |
| Website          | http://www.vmware.com/                |
| Twitter          | https://twitter.com/VMware            |
| Download         | [Link](https://download3.vmware.com/software/vmw-tools/nested-esxi/Nested_ESXi6.x_Appliance_Template_v5.ova) |

> Most of the informations find here has been found on this [Blogpost](http://www.virtuallyghetto.com/2015/12/deploying-nested-esxi-is-even-easier-now-with-the-esxi-virtual-appliance.html) from William Lam.

## Example

```Powershell
Deploy 'NestedESXi' {
    By vSphereOVF {
        FromSource 'D:\nested_esxi_appliance_v6.0u2.ova'
        To 'esxi.example.com'
        Tagged 'Prod'
        WithOptions @{
            Name = 'ESXI' # VM Name
            Datastore = 'DATASTORE01' # Datastore Name
            OvfConfiguration = @{
                'NetworkMapping.VM Network'               = 'Production' # vSphere Portgroup Network Mapping
                'guestinfo.hostname'                      = 'esxi01.example.com' # ESXi Hostname
                'guestinfo.ipaddress'                     = '192.168.1.1' # IP Address of vmk0
                'guestinfo.netmask'                       = '255.255.255.0' # Netmask of vmk0
                'guestinfo.gateway'                       = '192.168.1.254' # Gateway of vmk0
                'guestinfo.dns'                           = '192.168.1.10 192.168.1.11' # DNS Server 
                'guestinfo.domain'                        = 'example.com' # IP PNID (same as IP Address if there's no DNS)
                'guestinfo.ntp'                           = '192.168.1.10' # IP Network Prefix (CIDR notation)
           	    'guestinfo.syslog'                        = '192.168.1.20' # IP Gateway
                'guestinfo.password'                      = 'VMware1!' # Comma separated list of IP addresses of DNS servers.
                'guestinfo.ssh'                           = 'True' # Comma seperated list of hostnames or IP addresses of NTP Servers
                'guestinfo.createvmfs'                    = 'True' # Root Password
            }
            PowerOn = $true
        }
    }
}
```

## Parameters
### Common parameters

| Key             | Type    | Mandatory | Default | Description                                      |
| -------------   | --------| --------- | ------- |------------------------------------------------- |
| `FromSource`    | String  | True      | None    | Path to the OVF/OVA                              |
| `To`            | String  | True      | None    | ESXi server where you want to deploy the OVF/OVA |
| `Tagged`        | String  | False     | None    | Tag used for deployment                          |
| `WithOptions`   | Hash    | True      | None    | See next paragraph  for more informations        |

### Parameters for the WithOptions hash

| Key                  | Type    | Mandatory | Default                                  | Description                                        |
| ------------------   | --------| --------- | ---------------------------------------- |--------------------------------------------------- |
| `Name`               | String  | True      | None                                     | Name of the virtual machine                        |
| `Datastore`          | String  | False     | Datastore with the largest free space    | Datastore where the virtual machine will be stored |
| `PowerOn`            | Bool    | False     | False                                    | Is the virtual machine powered on after deploying  |
| `OvfConfiguration`   | Hash    | True      | None                                     | See next paragraph  for more informations          |

### Parameters for OvfConfiguration hash

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