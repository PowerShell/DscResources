<#
        .Synopsis
        A sample template for creating DSC Resource Unit Tests mainly for smaller resources
        .DESCRIPTION
        To Use:
        1. Copy to \Tests\Unit\ folder and rename <ResourceName>.tests.ps1 (e.g. MSFT_xFirewall.tests.ps1)
        2. Customize TODO sections.
        3. Delete all of the template instructional comments before pushing to git repository

        .NOTES
        Code in HEADER and FOOTER regions are standard and may be moved into DSCResource.Tools in
        Future and therefore should not be altered if possible.
#>


# TODO: Customize these parameters...
$script:DSCModuleName      = '<ModuleName>' # Example xNetworking
$script:DSCResourceName    = '<ResourceName>' # Example MSFT_xFirewall
# /TODO

#region HEADER

# Unit Test Template Version: 1.1.0
[String] $script:moduleRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
if ( (-not (Test-Path -Path (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests'))) -or `
     (-not (Test-Path -Path (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests\TestHelper.psm1'))) )
{
    & git @('clone','https://github.com/PowerShell/DscResource.Tests.git',(Join-Path -Path $script:moduleRoot -ChildPath '\DSCResource.Tests\'))
}

Import-Module (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests\TestHelper.psm1') -Force
$TestEnvironment = Initialize-TestEnvironment `
    -DSCModuleName $script:DSCModuleName `
    -DSCResourceName $script:DSCResourceName `
    -TestType Unit 

#endregion HEADER

# TODO: Other Optional Init Code Goes Here...

# Begin Testing
try
{
    #region Pester Test Initialization

    # TODO: Optionally create any variables here for use by your tests
    # See https://github.com/PowerShell/xNetworking/blob/dev/Tests/Unit/MSFT_xDhcpClient.Tests.ps1

    #endregion Pester Test Initialization

    # TODO: Common DSC Resource describe block structure
    # The following three Describe blocks are included as a common test pattern.
    # If a different test pattern would be more suitable, then test describe blocks
    # may be completely replaced. The goal of this pattern should be to describe 
    # the potential states a system could be in for each function.


    #region Function Get-TargetResource
    Describe "$($Global:DSCResourceName)\Get-TargetResource" {
        # TODO: Complete Get-TargetResource Tests...
    }
    #endregion Function Get-TargetResource
    
    #region Function Set-TargetResource
    Describe "$($Global:DSCResourceName)\Set-TargetResource" {
        # TODO: Complete Set-TargetResource Tests...
    }
    #endregion Function Set-TargetResource

    #region Function Test-TargetResource
    Describe "$($Global:DSCResourceName)\Test-TargetResource" {
        # TODO: Complete Test-TargetResource Tests...
    }
    #endregion Function Test-TargetResource

   

    #region Non-Exported Function Unit Tests

    # TODO: Pester Tests for any non-exported Helper Cmdlets
    # If the resource does not contain any non-exported helper cmdlets then
    # this block may be safetly deleted.
    InModuleScope $script:DSCResourceName {
        # The InModuleScope command allows you to perform white-box unit testing
        # on the internal (non-exported) code of a Script Module.

    }
    #endregion Non-Exported Function Unit Tests
}
finally
{
    #region FOOTER

    Restore-TestEnvironment -TestEnvironment $TestEnvironment

    #endregion

    # TODO: Other Optional Cleanup Code Goes Here...
}
