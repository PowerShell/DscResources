<#
    .SYNOPSIS
        Template for creating DSC Resource Unit Tests

    .DESCRIPTION
        To Use:
        1. Copy to \Tests\Unit\ folder and rename <ResourceName>.tests.ps1 (e.g. MSFT_xFirewall.tests.ps1)
        2. Customize TODO sections.
        3. Delete all template comments (TODOs, etc.)
        4. Remove any unused BeforeAll-, AfterAll-, BeforeEach- and AfterEach-blocks.
        5. Remove this comment-based help.

    .NOTES
        There are multiple methods for writing unit tests. This template provides a few examples
        which you are welcome to follow but depending on your resource, you may want to
        design it differently. Read through our TestsGuidelines.md file for an intro on how to
        write unit tests for DSC resources: https://github.com/PowerShell/DscResources/blob/master/TestsGuidelines.md
#>

#region HEADER
# TODO: Update to correct module name and resource name.
$script:DSCModuleName = '<ModuleName>'
$script:DSCResourceName = '<ResourceName>'

# Unit Test Template Version: 1.2.2
$script:moduleRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
if ( (-not (Test-Path -Path (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests'))) -or `
     (-not (Test-Path -Path (Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests\TestHelper.psm1'))) )
{
    & git @('clone','https://github.com/PowerShell/DscResource.Tests.git',(Join-Path -Path $script:moduleRoot -ChildPath 'DSCResource.Tests'))
}

Import-Module -Name (Join-Path -Path $script:moduleRoot -ChildPath (Join-Path -Path 'DSCResource.Tests' -ChildPath 'TestHelper.psm1')) -Force

# TODO: Insert the correct <ModuleName> and <ResourceName> for your resource
$TestEnvironment = Initialize-TestEnvironment `
    -DSCModuleName $script:DSCModuleName `
    -DSCResourceName $script:DSCResourceName `
    -ResourceType 'Mof' `
    -TestType Unit

#endregion HEADER

function Invoke-TestSetup
{
     # TODO: Optional init code goes here...
}

function Invoke-TestCleanup
{
    Restore-TestEnvironment -TestEnvironment $TestEnvironment

    # TODO: Other Optional Cleanup Code Goes Here...
}

# Begin Testing
try
{
    Invoke-TestSetup

    InModuleScope $script:DSCResourceName {
        # TODO: Optionally create any variables here for use by your tests

        # TODO: Complete the Describe blocks below and add more as needed.
        # The most common method for unit testing is to test by function. For more information
        # check out this introduction to writing unit tests in Pester:
        # https://www.simple-talk.com/sysadmin/powershell/practical-powershell-unit-testing-getting-started/#eleventh
        # You may also follow one of the patterns provided in the TestsGuidelines.md file:
        # https://github.com/PowerShell/DscResources/blob/master/TestsGuidelines.md

        Describe 'MSFT_<ResourceName>\Get-TargetResource' -Tag 'Get' {
            BeforeAll {
                # Per describe-block initialization
            }

            AfterAll {
                # Per describe-block cleanup
            }

            BeforeEach {
                # per-test-initialization
            }

            AfterEach {
                # per-test-cleanup
            }

            Context 'When the system is in the desired state' {
                BeforeAll {
                    # Per context-block initialization
                }

                AfterAll {
                    # Per context-block cleanup
                }

                BeforeEach {
                    # per test initialization
                }

                AfterEach {
                    # per test cleanup
                }

                <#
                    TODO: (Optional) If It-block description tends to be long,
                    consider adding nested Context-blocks ('When...'), e.g 'When
                    the configuration is absent', 'When the configuration should
                    be present' or 'When the current description is returned
                    as an empty string'.
                #>
                It 'Should ....test-description' {
                    # test-code
                }

                It 'Should ....test-description' {
                    # test-code
                }
            }

            Context 'When the system is not in the desired state' {
                It 'Should ....test-description' {
                    # test-code
                }
            }
        }

        Describe 'MSFT_<ResourceName>\Set-TargetResource' -Tag 'Set' {
            Context 'When the system is in the desired state' {
                It 'Should ...test-description' {
                    # test-code
                }
            }

            Context 'When the system is not in the desired state' {
                It 'Should ....test-description' {
                    # test-code
                }
            }
        }

        Describe 'MSFT_<ResourceName>\Test-TargetResource' -Tag 'Test' {
            Context 'When the system is in the desired state' {
                It 'Should ...test-description' {
                    # test-code
                }
            }

            Context 'When the system is not in the desired state' {
                It 'Should ....test-description' {
                    # test-code
                }
            }
        }

        Describe 'MSFT_<ResourceName>\Get-HelperFunction' -Tag 'Helper' {
            It 'Should ...test-description' {
                # test-code
            }

            It 'Should ....test-description' {
                # test-code
            }
        }

        # TODO: add more Describe blocks as needed
    }
}
finally
{
    Invoke-TestCleanup
}
