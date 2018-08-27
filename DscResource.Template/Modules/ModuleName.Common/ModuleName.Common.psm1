# Import Localization Strings
$localizedData = Get-LocalizedData `
    -ResourceName 'ModuleName.Common' `
    -ResourcePath $PSScriptRoot

<#
    .SYNOPSIS
        Short description of what the helper function does.

    .PARAMETER ParameterName1
        Descriptive text what this parameter needs and does.

    .PARAMETER ParameterName2
        Descriptive text what this parameter needs and does.
#>
function Get-Something
{
    [OutputType([System.String])]
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)
        [String]
        $ParameterName1,

        [Parameter()]
        [String]
        $ParameterName2
    )

    # More code here.

}
