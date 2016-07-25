<#
    .SYNOPSIS
    Output all the different keys from an OvfConfiguration.
    .DESCRIPTION
    Output all the different keys from an OvfConfiguration.
    This informations could be copy/past to create a PSDeploy file for deploying the OVF/OVA
    You need to have an active session with the array.
    .NOTES
    Written by Erwan Quelin under Apache licence - https://github.com/equelin/Unity-Powershell/blob/master/LICENSE
    .LINK
    https://github.com/equelin/PSDeploy-vSphereOVF-Recipes
    .PARAMETER OvfConfiguration
    OVF Configuration object retrieve from the command Get-OvfConfiguration.
    .EXAMPLE
    Get-OvfConfiguration -Ovf 'D:\vmware-vcsa.ova' | .\Get-OvfKeys

    Output all the different keys from an OvfConfiguration.
#>

[CmdletBinding()]
Param (
    [Parameter(Mandatory = $True,ValueFromPipeline=$True,ValueFromPipelinebyPropertyName=$True,HelpMessage = 'OVF Configuration object retrieve from the command Get-OvfConfiguration')]
    $OvfConfiguration
)

Process {

    If ($OvfConfiguration.GetType().Name -match 'OvfPropertyImpl') {

        # Output result
        Write-Host "'$($OvfConfiguration.key)' = '$($OvfConfiguration.Value)'"

    } else {
        # Get all properties with type CodeProperty
        $Props = $OvfConfiguration | Get-Member -ErrorAction SilentlyContinue | Where-Object { ($_.MemberType -match "CodeProperty")}

            $Props | ForEach-Object {

                # Get the new child object
                $NewObject = $OvfConfiguration.($_.Name)

                # Invoke function BrowseObject recursively
                .\Get-OvfKeys.ps1 -OvfConfiguration $NewObject
        } 
    }
}