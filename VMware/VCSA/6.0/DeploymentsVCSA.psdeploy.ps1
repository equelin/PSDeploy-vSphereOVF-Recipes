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

