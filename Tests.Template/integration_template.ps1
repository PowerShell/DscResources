<#
.Synopsis
   Template for creating DSC Resource Integration Tests
.DESCRIPTION
   To Use:
     1. Copy to \Tests\Integration\ folder and rename <ResourceName>.Integration.tests.ps1 (e.g. MSFT_xNeworking.Integration.tests.ps1)
     2. Customize TODO sections.
     3. Create test DSC Configurtion file <ResourceName>.config.ps1 (e.g. MSFT_xNeworking.config.ps1) from integration_config_template.ps1 file.

.NOTES
   Code in HEADER, FOOTER and DEFAULT TEST regions are standard and may be moved into
   DSCResource.Tools in Future and therefore should not be altered if possible.
#>

# TODO: Customize these parameters...
$script:DSCModuleName      = '<ModuleName>' # Example xNetworking
$script:DSCResourceName    = '<ResourceName>' # Example MSFT_xFirewall

#region HEADER
# Integration Test Template Version: 1.1.1
[String] $script:moduleRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
if ( (-not (Test-Path -Path (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests'))) -or `
     (-not (Test-Path -Path (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests\TestHelper.psm1'))) )
{
    & git @('clone','https://github.com/PowerShell/DscResource.Tests.git',(Join-Path -Path $script:moduleRoot -ChildPath '\DSCResource.Tests\'))
}

Import-Module -Name (Join-Path -Path $script:moduleRoot -ChildPath (Join-Path -Path 'DSCResource.Tests' -ChildPath 'TestHelper.psm1')) -Force
$TestEnvironment = Initialize-TestEnvironment `
    -DSCModuleName $script:DSCModuleName `
    -DSCResourceName $script:DSCResourceName `
    -TestType Integration

#endregion

# TODO: Other Init Code Goes Here...

# Using try/finally to always cleanup.
try
{
    #region Integration Tests
    $configFile = Join-Path -Path $PSScriptRoot -ChildPath "$($script:DSCResourceName).config.ps1"
    . $configFile

    Describe "$($script:DSCResourceName)_Integration" {
        #region DEFAULT TESTS
        It 'Should compile and apply the MOF without throwing' {
            {
                & "$($script:DSCResourceName)_Config" -OutputPath $TestDrive
                Start-DscConfiguration -Path $TestDrive `
                    -ComputerName localhost -Wait -Verbose -Force
            } | Should not throw
        }

        It 'Should be able to call Get-DscConfiguration without throwing' {
            { Get-DscConfiguration -Verbose -ErrorAction Stop } | Should Not throw
        }
        #endregion

        It 'Should have set the resource and all the parameters should match' {
            # TODO: Validate the Config was Set Correctly Here...
        }
    }
    #endregion

}
finally
{
    #region FOOTER

    Restore-TestEnvironment -TestEnvironment $TestEnvironment

    #endregion

    # TODO: Other Optional Cleanup Code Goes Here...
}
