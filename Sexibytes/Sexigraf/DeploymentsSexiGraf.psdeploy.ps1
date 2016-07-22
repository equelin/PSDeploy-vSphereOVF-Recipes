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

