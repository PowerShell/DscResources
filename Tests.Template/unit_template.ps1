<#
        .SYNOPSIS
        Template for creating DSC Resource Unit Tests
        .DESCRIPTION
        To Use:
        1. Copy to \Tests\Unit\ folder and rename <ResourceName>.tests.ps1 (e.g. MSFT_xFirewall.tests.ps1)
        2. Customize TODO sections.
        3. Delete all template comments (TODOs, etc.)

        .NOTES
        There are multiple methods for writing unit tests. This template provides a few examples
        which you are welcome to follow but depending on your resource, you may want to
        design it differently.
#>


#region HEADER

# Unit Test Template Version: 1.2.0
$script:moduleRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
if ( (-not (Test-Path -Path (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests'))) -or `
     (-not (Test-Path -Path (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests\TestHelper.psm1'))) )
{
    & git @('clone','https://github.com/PowerShell/DscResource.Tests.git',(Join-Path -Path $script:moduleRoot -ChildPath '\DSCResource.Tests\'))
}

Import-Module (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests\TestHelper.psm1') -Force

# TODO: Insert the correct <ModuleName> and <ResourceName> for your resource
$TestEnvironment = Initialize-TestEnvironment `
    -DSCModuleName '<ModuleName>' `
    -DSCResourceName '<ResourceName>' `
    -TestType Unit 

#endregion HEADER


# Begin Testing
try
{

    Invoke-TestSetup

    InModuleScope '<ResourceName>' {
        # TODO: Optionally create any variables here for use by your tests
    
        # TODO: Complete the Describe blocks below and add more as needed.
        # The most common method for unit testing is to test by function. For more information
        # check out this introduction to writing unit tests in Pester: 
        # https://www.simple-talk.com/sysadmin/powershell/practical-powershell-unit-testing-getting-started/#eleventh
        # You may also follow one of the patterns provided at the end of this file
        
        Describe '<Test-name>' {
            
            BeforeEach {
                # per-test-initialization
            }
            AfterEach {
                # per-test-cleanup
            }
            Context 'Context-description' {
            
                BeforeEach {
                    # per-test-initialization
                }
                AfterEach {
                    # per-test-cleanup
                }

                It 'Should...test-description' {
                    # test-code
                }
                . . .
                It 'Should...test-description' {
                    # test-code
                }
            }

            Context 'Context-description' {
                It 'Should ....test-description' {
                    # test-code
                }
            }
        }

        Describe '<Test-name>' {
            Context '<Context-description>' {
                It 'Should ...test-description' {
                    # test-code
                }
            }
        }
        
        # TODO: add more Describe blocks as needed
    }
}
finally
{
 
    Invoke-TestCleanup
    
}

function Invoke-TestSetup {

    # TODO: Optional init code goes here...
    
}

function Invoke-TestCleanup {

    Restore-TestEnvironment -TestEnvironment $TestEnvironment
    
    # TODO: Other Optional Cleanup Code Goes Here...
    
}

# TODO: Below are 2 example patterns for writing DSC tests - delete this code before submitting

<#
        # The goal of this pattern should be to describe 
        # the potential states a system could be in for each function.


        #region Function Get-TargetResource
        Describe 'Get-TargetResource' {       
        # TODO: Complete Get-TargetResource Tests...
        }
        #endregion Function Get-TargetResource
    
        #region Function Set-TargetResource
        Describe 'Set-TargetResource' {
        # TODO: Complete Set-TargetResource Tests...
        }
        #endregion Function Set-TargetResource

        #region Function Test-TargetResource
        Describe 'Test-TargetResource' {
        # TODO: Complete Test-TargetResource Tests...
        }
        #endregion Function Test-TargetResource
#>

<#
        # The goal of this pattern should be to describe 
        # the potential states a system could be in so that the get/set/test cmdlets
        # can be tested in those states. Any mocks that relate to that specific state
        # can be included in the relevant Describe block. For a more detailed description
        # of this approach please review https://github.com/PowerShell/DscResources/issues/143 

        # Add as many of these example 'states' as required to simulate the scenarions that
        # the DSC resource is designed to work with, below a simple 'is in desired state' and
        # 'is not in desired state' are used, but there may be more complex combinations of 
        # factors, depending on how complex your resource is.

        #region Example state 1
        Describe 'The system is not in the desired state' {
        #TODO: Mock cmdlets here that represent the system not being in the desired state

        #TODO: Create a set of parameters to test your get/set/test methods in this state
        $testParameters = @{
            Property1 = 'value'
            Property2 = 'value'
        }

        #TODO: Update the assertions below to align with the expected results of this state
        It 'Should return something' {
            Get-TargetResource @testParameters | Should Be 'something'
        }

        It 'Should return false' {
            Test-TargetResource @testParameters | Should be $false
        }

        It 'Should call Demo-CmdletName' {
            Set-TargetResource @testParameters

            #TODO: Assert that the appropriate cmdlets were called
            Assert-MockCalled Demo-CmdletName 
        }
        }
        #endregion Example state 1

        #region Example state 2
        Describe 'The system is in the desired state' {
        #TODO: Mock cmdlets here that represent the system being in the desired state

        #TODO: Create a set of parameters to test your get/set/test methods in this state
        $testParameters = @{
            Property1 = 'value'
            Property2 = 'value'
        }

        #TODO: Update the assertions below to align with the expected results of this state
        It 'Should return something' {
            Get-TargetResource @testParameters | Should Be 'something'
        }

        It 'Should return true' {
            Test-TargetResource @testParameters | Should be $true
        }
        }
        #endregion Example state 1

#>
