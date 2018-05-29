<#
    .SYNOPSIS
        Returns ...

    .PARAMETER MandatoryParameter
        This ...
#>
function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $MandatoryParameter
    )

    # TODO: Code that returns the current state.

    return @{
        Ensure = $ensure
        MandatoryParameter = $value1
        NonMandatoryParameter = $value2
    }
}

<#
    .SYNOPSIS
        Sets ...

    .PARAMETER MandatoryParameter
        This ...

    .PARAMETER NonMandatoryParameter
        This ...
#>
function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $MandatoryParameter,

        [Parameter()]
        [System.String]
        $Ensure = 'Present',

        [Parameter()]
        [System.String]
        $NonMandatoryParameter
    )

    # Code that sets the desired state if evaluated to not in desired state.
}

<#
    .SYNOPSIS
        Determines if ...

    .PARAMETER MandatoryParameter
        This ...

    .PARAMETER NonMandatoryParameter
        This ...
#>
function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $MandatoryParameter,

        [Parameter()]
        [System.String]
        $Ensure = 'Present',

        [Parameter()]
        [System.String]
        $NonMandatoryParameter
    )

    $getTargetResourceParameters = @{
        MandatoryParameter = $MandatoryParameter
    }

    $getTargetResourceResult = Get-TargetResource @getTargetResourceParameters

    # Code that tests the desired state.
}
