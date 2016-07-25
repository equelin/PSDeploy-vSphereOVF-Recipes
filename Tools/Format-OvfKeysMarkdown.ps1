<#
    .SYNOPSIS
    Output OvfConfiguration keys in a markdown table format
    .DESCRIPTION
    Output OvfConfiguration keys in a markdown table format
    This informations could be copy/past to a README.md tu publish on Github.
    .NOTES
    Written by Erwan Quelin under Apache licence - https://github.com/equelin/Unity-Powershell/blob/master/LICENSE
    .LINK
    https://github.com/equelin/PSDeploy-vSphereOVF-Recipes
    .PARAMETER OvfConfiguration
    OVF Configuration object retrieve from the command Get-OvfConfiguration.
    .PARAMETER NoHeader
    Does not output the table header.
    .EXAMPLE
    Get-OvfConfiguration -Ovf 'D:\vmware-vcsa.ova' | .\Format-OvfKeysMarkdown.ps1

    Output OvfConfiguration keys in a markdown table format
#>

[CmdletBinding()]
Param (
    [Parameter(Mandatory = $True,ValueFromPipeline=$True,ValueFromPipelinebyPropertyName=$True,HelpMessage = 'OVF Configuration object retrieve from the command Get-OvfConfiguration')]
    $OvfConfiguration,
    [Switch]$NoHeader
)

Begin {
    If (-not $NoHeader) {
        Write-Host "| Key                         | Type    | Mandatory | Default                                  | Description                                        |"
        Write-Host "| -------------------------   | --------| --------- | ---------------------------------------- |--------------------------------------------------- |"
    }
}

Process {

    If ($OvfConfiguration.GetType().Name -match 'OvfPropertyImpl') {

        If ($OvfConfiguration.Value) {
            $Default = $OvfConfiguration.Value
        } else {
            $Default = 'None'
        }

        $Description = $OvfConfiguration.Description -replace "`t|`n|`r",""

        # Output result
        Write-Host "| ``$($OvfConfiguration.key)`` | $($OvfConfiguration.OvfTypeDescription) | | $Default | $Description |"

    } else {
        # Get all properties with type CodeProperty
        $Props = $OvfConfiguration | Get-Member -ErrorAction SilentlyContinue | Where-Object { ($_.MemberType -match "CodeProperty")}

            $Props | ForEach-Object {

                # Get the new child object
                $NewObject = $OvfConfiguration.($_.Name)

                # Invoke function BrowseObject recursively
                .\Format-OvfKeysMarkdown.ps1 -OvfConfiguration $NewObject -NoHeader
        } 
    }
}