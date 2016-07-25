# PSDeploy-vSphereOVF-Recipes
Library of recipes for deploying Vmware vCenter Server Appliance 6.0

| Key              | Value                                 |
| ---------------- | ------------------------------------- |
| Name             | VCSA                                  |
| Editor / Vendor  | VMware                                |
| Website          | http://www.vmware.com/                |
| Twitter          | https://twitter.com/VMware            |

## Example

```Powershell
Deploy 'VCSA' {
    By vSphereOVF {
        FromSource 'D:\vmware-vcsa.ova'
        To 'esxi.example.com'
        Tagged 'Prod'
        WithOptions @{
            Name = 'VCENTER' # VM Name
            Datastore = 'DATASTORE01' # Datastore Name
            OvfConfiguration = @{
                'NetworkMapping.Network 1'                = 'Production' # vSphere Portgroup Network Mapping
                'DeploymentOption.value'                  = 'tiny' # tiny,small,medium,large,management-tiny,management-small,management-medium,management-large,infrastructure
                'IpAssignment.IpProtocol'                 = 'IPv4' # IP Protocol
                'guestinfo.cis.appliance.net.addr.family' = 'ipv4' # IP Address Family
                'guestinfo.cis.appliance.net.mode'        = 'static' # IP Address Mode
                'guestinfo.cis.appliance.net.addr'        = '192.168.1.1' # IP Address 
                'guestinfo.cis.appliance.net.pnid'        = '192.168.1.1' # IP PNID (same as IP Address if there's no DNS)
                'guestinfo.cis.appliance.net.prefix'      = '24' # IP Network Prefix (CIDR notation)
                'guestinfo.cis.appliance.net.gateway'     = '192.168.1.254' # IP Gateway
                'guestinfo.cis.appliance.net.dns.servers' = '192.168.1.10 192.168.1.11' # Comma separated list of IP addresses of DNS servers.
                'guestinfo.cis.appliance.ntp.servers'     = '0.pool.ntp.org' # Comma seperated list of hostnames or IP addresses of NTP Servers
                'guestinfo.cis.appliance.root.passwd'     = 'VMware1!' # Root Password
                'guestinfo.cis.appliance.ssh.enabled'     = 'True' # Enable SSH
                'guestinfo.cis.vmdir.domain-name'         = 'vsphere.local' # SSO Domain Name
                'guestinfo.cis.vmdir.site-name'           = 'site01' # SSO Site Name
                'guestinfo.cis.vmdir.password'            = 'VMware1!' # SSO Admin Password
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
| `guestinfo.cis.appliance.net.addr.family` | string | | None | Network IP address family (i.e., 'ipv4' or 'ipv6'). |
| `guestinfo.cis.appliance.net.addr` | string | | None | Network IP address.  Only provide this when mode is 'static'.  Can be IPv4 or IPv6 based on specified address family. |
| `guestinfo.cis.appliance.net.dns.servers` | string | | None | Comma separated list of IP addresses of DNS servers. |
| `guestinfo.cis.appliance.net.gateway` | string | | None | IP address of default gateway.  Can be 'default' when using IPv6. |
| `guestinfo.cis.appliance.net.mode` | string | | None | Network mode (i.e., 'static', 'dhcp', or 'autoconf' (IPv6 only). |
| `guestinfo.cis.appliance.net.pnid` | string | | None | Network identity (IP address or fully-qualified domain name) services should use when advertising themselves. |
| `guestinfo.cis.appliance.net.ports` | string | | None | A string encoding a JSON object mapping port names to port numbers. |
| `guestinfo.cis.appliance.net.prefix` | string | | None | Network prefix length.  Only provide this when mode is 'static'.  0-32 for IPv4.  0-128 for IPv6. |
| `guestinfo.cis.appliance.ntp.servers` | string | | None | A comma-seperated list of hostnames or IP addresses of NTP Servers |
| `guestinfo.cis.appliance.root.passwd` | password | | None | Password to assign to root account.  If blank, password can be set on the console. |
| `guestinfo.cis.appliance.ssh.enabled` | boolean | | None | Set whether SSH-based remote login is enabled.  This configuration can be changed after deployment. |
| `guestinfo.cis.appliance.time.tools-sync` | boolean | | None | Set whether VMware tools based time synchronization should be used. This parameter is ignored if appliance.ntp.servers is not empty. |
| `guestinfo.cis.ceip_enabled` | string | | None | VMware’s Customer Experience Improvement Program ("CEIP") provides VMware with information that enables VMware to improve its products and services, to fix problems, and to advise you on how best to deploy and use our products. As part of the CEIP, VMware collects technical information about your organization’s use of VMware products and services on a regular basis in association with your organization’s VMware license key(s). This information does not personally identify any individual. For more details about the Program and how VMware uses the information it collects through CEIP, please see the product documentation at http://www.vmware.com/info?id=1399. If you want to participate in VMware’s CEIP for this product, set this property to True. You may join or leave VMware’s CEIP for this product at any time. |
| `guestinfo.cis.clientlocale` | string | | None | This parameter specifies the client locale. Supported locales are en, fr, ja, ko, zh_CN and zh_TW. English is assumed if locale is unknown. |
| `guestinfo.cis.db.instance` | string | | None | String describing the external database instance. Values could be anything depending on what the database instance name the DBA creates in the external db. (ignored when the db.type is 'embedded'). |
| `guestinfo.cis.db.password` | string | | None | String providing the password to use when connecting to external database (ignored when db.type is 'embedded'). |
| `guestinfo.cis.db.provider` | string | | None | String describing the external database provider. The only supported value is 'oracle' (ignored when the db.type is 'embedded'). |
| `guestinfo.cis.db.servername` | string | | None | String naming the the hostname of the server on which the external database is running (ignored when db.type is 'embedded'). |
| `guestinfo.cis.db.serverport` | string | | None | String describing the port on the host on which the external database is running (ignored when db.type is 'embedded'). |
| `guestinfo.cis.db.type` | string | | None | String indicating whether the database is 'embedded' or 'external'. |
| `guestinfo.cis.db.user` | string | | None | String naming the account to use when connecting to external database (ignored when db.type is 'embedded'). |
| `guestinfo.cis.kv.new` | boolean | | None | If this parameter is set to True, then all clients will leverage the new local KV store, else they will continue to use the old GemFire based KV store. Only available in obj and beta builds. Also, this parameter will be removed when we do a final switch-over to the new local KV store and get rid of GemFire based KV |
| `guestinfo.cis.lookup.hidessltrust` | boolean | | None | If this parameter is set to True, then all lookup service will return endpoints without SSL trust.  Can be used for testing VECS integration. |
| `guestinfo.cis.system.vm0.hostname` | string | | None | When deploying a vCenter Server Node, please provide the FQDN or IP address of a Platform Services Controller (leave blank otherwise).  The choice of FQDN versus IP address is decided based on the Platform Services Controller's own notion of its network identity. |
| `guestinfo.cis.system.vm0.port` | string | | None | When deploying a vCenter Server pointing to an external platform services controller, please provide the HTTPS port of the external platform services controller if a custom port number is being used. The default HTTPS port number is 443. |
| `guestinfo.cis.upgrade.silent` | string | | None | Suppress questions and use default answers |
| `guestinfo.cis.upgrade.source.export.directory` | string | | None | Folder on the source appliance, where to store migrate data. Optional. Set only for upgrade |
| `guestinfo.cis.upgrade.source.guest.password` | string | | None | Password for the appliance operating system to upgrade. Set only for upgrade. |
| `guestinfo.cis.upgrade.source.guest.user` | string | | None | Username for the appliance operating system to upgrade.  Usually root. Set only for upgrade. |
| `guestinfo.cis.upgrade.source.guestops.host.addr` | string | | None | IP/hostname of the host that manages appliance to upgrade.  Can be  either vCenter or ESX host.  Set only for upgrade. |
| `guestinfo.cis.upgrade.source.guestops.host.password` | string | | None | Password for the host that manages appliance to upgrade.  Can be  either vCenter or ESX host.  Set only for upgrade. |
| `guestinfo.cis.upgrade.source.guestops.host.user` | string | | None | Username for the host that manages appliance to upgrade.  Can be  either vCenter or ESX host.  Set only for upgrade. |
| `guestinfo.cis.upgrade.source.ssl.thumbprint` | string | | None | Thumbprint for the SSL certificate of the host that manages the appliance to upgrade. Set only for upgrade. |
| `guestinfo.cis.upgrade.source.vpxd.ip` | string | | None | IP/hostname of the appliance to upgrade. Set only for upgrade. |
| `guestinfo.cis.upgrade.source.vpxd.password` | string | | None | vCenter password for the appliance to upgrade. Set only for upgrade. |
| `guestinfo.cis.upgrade.source.vpxd.user` | string | | None | vCenter username for the appliance to upgrade. Set only for upgrade. |
| `guestinfo.cis.upgrade.user.options` | string | | None | Advanced upgrade settings specified in json format. Optional. Set only for upgrade |
| `guestinfo.cis.vmdir.domain-name` | string | | None | For the first instance of the identity domain, this is the name of the newly created domain. |
| `guestinfo.cis.vmdir.first-instance` | boolean | | None | If this parameter is set to True, the VMware directory instance is setup as the first instance of a new identity domain. Otherwise, the instance is setup as a replication partner. |
| `guestinfo.cis.vmdir.password` | password | | None | For the first instance of the identity domain,  this is the password given to the Administrator account.  Otherwise, this is the password of the Administrator account of the replication partner. |
| `guestinfo.cis.vmdir.replication-partner-hostname` | string | | None | The hostname of the VMware directory replication partner.  This value is ignored for the first instance of the identity domain. |
| `guestinfo.cis.vmdir.site-name` | string | | None | Name of site.  Use 'Default-First-Site' to define a new site. |
| `DeploymentOption` | string["tiny", "small", "medium", "large", "management-tiny", "management-small", "management-medium", "management-large", "infrastructure"] | | None | Tiny (up to 10 hosts, 100 VMs)This will deploy a Tiny VM configured with 2 vCPUs and 8 GB of memory and requires 120 GB of disk space. This option contains vCenter Server with an embedded Platform Services Controller.Small (up to 100 hosts, 1,000 VMs)This will deploy a Small VM configured with 4 vCPUs and 16 GB of memory and requires 150 GB of disk space. This option contains vCenter Server with an embedded Platform Services Controller.Medium (up to 400 hosts, 4,000 VMs)This will deploy a Medium VM configured with 8 vCPUs and 24 GB of memory and requires 300 GB of disk space. This option contains vCenter Server with an embedded Platform Services Controller.Large (up to 1000 hosts, 10,000 VMs)This will deploy a Large VM configured with 16 vCPUs and 32 GB of memory and requires 450 GB of disk space. This option contains vCenter Server with an embedded Platform Services Controller.Tiny (up to 10 hosts, 100 VMs)This will deploy a Tiny VM configured with 2 vCPUs and 8 GB of memory and requires 120 GB of disk space. These resources will be used by the vCenter Server services.Small (up to 100 hosts, 1,000 VMs)This will deploy a Small VM configured with 4 vCPUs and 16 GB of memory and requires 150 GB of disk space. These resources will be used by the vCenter Server services.Medium (up to 400 hosts, 4,000 VMs)This will deploy a Medium VM configured with 8 vCPUs and 24 GB of memory and requires 300 GB of disk space. These resources will be used by the vCenter Server services.Large (up to 1000 hosts, 10,000 VMs)This will deploy a Large VM configured with 16 vCPUs and 32 GB of memory and requires 450 GB of disk space. These resources will be used by the vCenter Server services.Platform Services ControllerThis will deploy an external Platform Services Controller VM with 2 vCPU and 2GB of memory and requires 30 GB of disk space. |
| `IpAssignment.IpProtocol` | string["IPv4", "IPv6"] | | None |  |
| `NetworkMapping.Network 1` | string | | None | The "Network 1" network |
| `vami.DNS.VMware_vCenter_Server_Appliance` | string | | None | The domain name server IP Addresses for this VM (comma separated). Leave blank if DHCP is desired. |
| `vami.domain.VMware_vCenter_Server_Appliance` | string | | None | The domain name of this VM. Leave blank if DHCP is desired. |
| `vami.gateway.VMware_vCenter_Server_Appliance` | string | | None | The default gateway address for this VM. Leave blank if DHCP is desired. |
| `vami.ip0.VMware_vCenter_Server_Appliance` | string | | None | The IP address for this interface. Leave blank if DHCP is desired. |
| `vami.netmask0.VMware_vCenter_Server_Appliance` | string | | None | The netmask or prefix for this interface. Leave blank if DHCP is desired. |
| `vami.searchpath.VMware_vCenter_Server_Appliance` | string | | None | The domain search path (comma or space separated domain names) for this VM. Leave blank if DHCP is desired. |