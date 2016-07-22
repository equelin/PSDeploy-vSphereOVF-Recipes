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

