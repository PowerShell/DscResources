<#
        .SYNOPSIS
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
$script:dscModuleName      = '<ModuleName>' # Example xNetworking
$script:dscResourceName    = '<ResourceName>' # Example MSFT_xFirewall

#region HEADER

# Unit Test Template Version: 1.1.0
[String] $script:moduleRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
if (-not (Test-Path -Path (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests\TestHelper.psm1')))
{
    & git @('clone','https://github.com/PowerShell/DscResource.Tests.git',(Join-Path -Path $script:moduleRoot -ChildPath '\DSCResource.Tests\'))
}

Import-Module (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests\TestHelper.psm1') -Force
$TestEnvironment = Initialize-TestEnvironment `
    -DSCModuleName $script:dscModuleName `
    -DSCResourceName $script:dscResourceName `
    -TestType Unit 

#endregion HEADER



# Begin Testing
try
{
    Initialize-PesterTests

    # TODO: Common DSC Resource describe block structure
    # The following three Describe blocks are included as a common test pattern.
    # If a different test pattern would be more suitable, then test describe blocks
    # may be completely replaced. The goal of this pattern should be to describe 
    # the potential states a system could be in for each function.


    #region Function Get-TargetResource
    Describe "$($script:dscResourceName)\Get-TargetResource" {       
        # TODO: Complete Get-TargetResource Tests...
    }
    #endregion Function Get-TargetResource
    
    #region Function Set-TargetResource
    Describe "$($script:dscResourceName)\Set-TargetResource" {
        # TODO: Complete Set-TargetResource Tests...
    }
    #endregion Function Set-TargetResource

    #region Function Test-TargetResource
    Describe "$($script:dscResourceName)\Test-TargetResource" {
        # TODO: Complete Test-TargetResource Tests...
    }
    #endregion Function Test-TargetResource

   

    #region Non-Exported Function Unit Tests

    # TODO: Pester Tests for any non-exported Helper Cmdlets
    # If the resource does not contain any non-exported helper cmdlets then
    # this block may be safely deleted.
    InModuleScope $script:dscResourceName {
        # The InModuleScope command allows you to perform white-box unit testing
        # on the internal (non-exported) code of a Script Module.

    }
    #endregion Non-Exported Function Unit Tests
}
finally
{
 
    Complete-PesterTests
    
}

function Initialize-PesterTests {
    
    # TODO: Optionally create any variables here for use by your tests
    # See https://github.com/PowerShell/xNetworking/blob/dev/Tests/Unit/MSFT_xDhcpClient.Tests.ps1
    # Optional other init code goes here...
    
}

function Complete-PesterTests {

    Restore-TestEnvironment -TestEnvironment $TestEnvironment
    
    # TODO: Other Optional Cleanup Code Goes Here...
    
}
