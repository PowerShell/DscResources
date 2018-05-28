<#
.Synopsis
   Template for creating DSC Resource Integration Tests
.DESCRIPTION
   To Use:
     1. Copy to \Tests\Integration\ folder and rename <ResourceName>.Integration.tests.ps1 (e.g. MSFT_Firewall.Integration.tests.ps1)
     2. Customize TODO sections.
     3. Create test DSC Configuration file <ResourceName>.config.ps1 (e.g. MSFT_Firewall.config.ps1) from integration_config_template.ps1 file.

.NOTES
   Code in HEADER, FOOTER and DEFAULT TEST regions are standard and may be moved into
   DSCResource.Tools in Future and therefore should not be altered if possible.
#>

# TODO: Customize these parameters...
$script:dscModuleName = '<ModuleName>' # TODO: Example 'NetworkingDsc'
$script:dscResourceFriendlyName = '<ResourceFriendlyName>' # TODO: Example 'Firewall'
$script:dcsResourceName = "MSFT_$($script:dscResourceFriendlyName)" # TODO: Update prefix

#region HEADER
# Integration Test Template Version: 1.3.0
[String] $script:moduleRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
if ( (-not (Test-Path -Path (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests'))) -or `
    (-not (Test-Path -Path (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests\TestHelper.psm1'))) )
{
    & git @('clone', 'https://github.com/PowerShell/DscResource.Tests.git', (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests'))
}

Import-Module -Name (Join-Path -Path $script:moduleRoot -ChildPath (Join-Path -Path 'DSCResource.Tests' -ChildPath 'TestHelper.psm1')) -Force
$TestEnvironment = Initialize-TestEnvironment `
    -DSCModuleName $script:dscModuleName `
    -DSCResourceName $script:dcsResourceName `
    -TestType Integration
#endregion

# TODO: (Optional) Other init code goes here.

# Using try/finally to always cleanup.
try
{
    #region Integration Tests
    $configurationFile = Join-Path -Path $PSScriptRoot -ChildPath "$($script:dcsResourceName).config.ps1"
    . $configurationFile

    Describe "$($script:dcsResourceName)_Integration" {
        # TODO: Update with the correct name of the configuration.
        $configurationName = "$($script:dcsResourceName)_<ShortDescriptiveName>_Config"

        Context ('When using configuration {0}' -f $configurationName) {
            #region DEFAULT TESTS
            It 'Should compile and apply the MOF without throwing' {
                {
                    <#
                        TODO: (Optional) Add any additional parameters needed
                        for compilation of the configuration, like credentials.
                    #>
                    $configurationParameters = @{
                        OutputPath           = $TestDrive
                        <#
                            TODO: The variable $ConfigurationData was dot-sourced
                            above. (Optional) The configuration data hash table
                            can be moved into this file as appropriate.
                        #>
                        ConfigurationData    = $ConfigurationData
                    }

                    & $configurationName @configurationParameters

                    $startDscConfigurationParameters = @{
                        Path         = $TestDrive
                        ComputerName = 'localhost'
                        Wait         = $true
                        Verbose      = $true
                        Force        = $true
                        ErrorAction  = 'Stop'
                    }

                    Start-DscConfiguration @startDscConfigurationParameters
                } | Should -Not -Throw
            }

            It 'Should be able to call Get-DscConfiguration without throwing' {
                {
                    $script:currentConfiguration = Get-DscConfiguration -Verbose -ErrorAction Stop
                } | Should -Not -Throw
            }

            It 'Should have set the resource and all the parameters should match' {
                $resourceCurrentState = $script:currentConfiguration | Where-Object -FilterScript {
                    $_.ConfigurationName -eq $configurationName `
                    -and $_.ResourceId -eq "[$($script:dscResourceFriendlyName)]Integration_Test"
                }

                # TODO: Validate the Config was Set Correctly Here...
                $resourceCurrentState.Ensure | Should -Be 'Present'
                $resourceCurrentState.Property | Should -Be $ConfigurationData.AllNodes.Property1
            }

            It 'Should return $true when Test-DscConfiguration is run' {
                Test-DscConfiguration | Should -Be $true
            }
            #endregion
        }

        <#
            TODO: (Optional) Add a new context block for the next configuration
            that should be tested.
        #>

    }
    #endregion

}
finally
{
    #region FOOTER
    Restore-TestEnvironment -TestEnvironment $TestEnvironment
    #endregion

    # TODO: (Optional) Other cleanup code goes here.
}
