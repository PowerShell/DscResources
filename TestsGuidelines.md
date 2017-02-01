# DSC Resource Testing Guidelines

General Rules
-------------

 * Each DSC module should contain the following Test folder structure:
```
       Tests
       |---Unit
       |---Integration
```
 * The Tests\Unit folder must contain a Test Script for each DSC Resource in the DSC Module with the filename ```MSFT_<ResourceName>.tests.ps1```.
 * The Tests\Integration folder should, whenever possible, contain a Test Script for each DSC Resource in the DSC Module with the filename ```MSFT_<ResourceName>.integration.tests.ps1```.
 * Each Test Script should contain [Pester](https://github.com/pester/Pester) based tests.
 * Integration tests should be created when possible, but for some DSC resources this may not be possible. For example, when integration tests would cause the testing computer configuration to be damaged.
 * Unit and Integration tests should be created using the Template files that are located in the [Tests.Template](Tests.Template) folder in this repository.
 * The Unit and Integration test templates require that ```Git.exe``` be installed and can be found in the ```%PATH%``` on the testing computer.
 * The Unit and Integration test templates will automatically download or update the [DSCResource.Tests repository](https://github.com/PowerShell/DscResource.Tests) using Git.exe to the DSC Module folder.
 * Ensure that the .gitignore file for the resource module contains **DSCResource.Tests** so that this folder is not accidentally included in a commit to your resource repository.
 * Ensure that when creating or updating unit/integration tests from the Test.Templates the Version number of the test template file used remains in the test file.

Creating DSC Resource Unit Test Instructions
--------------------------------------------
 1. Copy the ```\Tests.Template\unit_template.ps1``` to the ```\Tests\Unit\``` folder and rename to ```MSFT_x<ResourceName>.tests.ps1```
 2. Open ```MSFT_x<ResourceName>.tests.ps1``` and customize TODO sections.
  - **Note: The existing Describe blocks do not have to be used. The blocks included are a common test pattern, but may be completely replaced with a more suitable pattern.**

**Important: Please ensure that the test files created retain the version number of the template used to create them.**

Creating DSC Resource Integration Test Instructions
---------------------------------------------------
 1. Copy the ```\Tests.Template\integration_template.ps1``` to ```\Tests\Integration\``` folder and rename ```MSFT_x<ResourceName>.Integration.tests.ps1```
 2. Open ```MSFT_x<ResourceName>.Integration.tests.ps1``` and customize TODO sections.
 3. Copy the ```\Tests.Template\integration_comfig_template.ps1``` to ```\Tests\Integration\``` folder and rename ```MSFT_x<ResourceName>.config.ps1```
 4. Open ```MSFT_x<ResourceName>.config.ps1``` and customize TODO sections.

**Important: Please ensure that the test files created retain the version number of the template used to create them.**

Updating DSC Resource Tests
---------------------------
It is possible that the Unit and Integration test templates may change in future, either to support new functionality or fix an issue.
When a change is made to a template, it will be documented in the [Tests.Template\ChangeList.md](Tests.Template\ChangeList.md) file.
The version number in any current tests can be compared with the Change List to determine what has changed since the tests were updated.
If any unit or integration tests based on these templates require any enhancements or fixes then they will need to be updated manually.

**Important: Please ensure that when updating a test with the new Test Template content that the Template version number is also updated to match the new template.**

Running Tests Locally
---------------------
All tests are automatically run via AppVeyor when the repository is updated.
However, it is recommended that all tests be run locally before being committed.

Requirements for running all tests locally:
 1. Git is installed and the ```Git.exe``` can be found in the ```%PATH%``` variable.
 2. The latest [Pester Module](https://github.com/pester/Pester) is installed, either manually or via PowerShellGet.
 3. An internet connection is available so that the DSCResource.Tests repository can be downloaded or updated using Git.

Unit Testing Private Functions
------------------------------
If a resource contains private (non-exported) functions that need to be tested, then to allow these functions to be tested by Pester, they must be contained in an ```InModuleScope``` Pester block:

```powershell
InModuleScope $Global:DSCResourceName {
    Describe "$($Global:DSCResourceName)\Get-FirewallRuleProperty" {
        # Test Get-FirewallRuleProperty private/non-exported function
    }
}
```

_Note: The core DSC Resource functions ```Get-TargetResource```, ```Set-TargetResource``` and ```Test-TargetResource``` must always be public functions, so do not need to be containined in an ```InModuleScope``` block._

Using Variables Declared by the Module in Tests
-----------------------------------------------
It is common for modules to declare variables that are needed inside the module, but may also be required for unit testing.
One common example of this is the ```LocalizedData``` variable that contains localized messages used by the resource.
Variables declared at the module scope (private variables) can not be accessed by unit tests that are not inside an ```InModuleScope``` Pester block.

There are two solutions to this:
1. Use the ```InModuleScope``` to copy the private variable into a variable scoped to the Unit test:
```powershell
$LocalizedData = InModuleScope $Global:DSCResourceName {
    $LocalizedData
}
```
2. Add any variables that are required to be accessed outside the module by unit tests to the ```Export-ModuleMember``` cmdlet in the DSC Resource:
```powershell
Export-ModuleMember -Function *-TargetResource -Variables LocalizedData
```

Creating Mock Output Variables without InModuleScope
----------------------------------------------------
One useful pattern used when creating unit tests is to create variables that contain objects that will be returned when mocked cmdlets are called.
These variables are often used many times over a single unit test file and so assigning each to a variable is essential to reduce the size of the unit test as well as improve readability and maintainability.
For example:
```powershell
$MockNetAdapter = @{
    Name              = 'Ethernet'
    PhysicalMediaType = '802.3'
    Status            = 'Up'
}

# Create a mock
Mock `
    -CommandName Get-NetAdapter `
    -MockWith { return $MockNetAdapter }
```

However, when ```InModuleScope``` is being used the variables that are defined won't be accessible from within the mocked cmdlets.
The solution to this is create a script block variable that contains the mocked object and then assign that to the Mock.

```powershell
$GetNetAdapter_PhysicalNetAdapterMock = {
    return @{
        Name              = 'Ethernet'
        PhysicalMediaType = '802.3'
        Status            = 'Up'
    }
}

# Create a mock
Mock `
    -CommandName Get-NetAdapter `
    -ModuleName $script:ModuleName `
    -MockWith $GetNetAdapter_PhysicalNetAdapterMock
```

Example Unit Test Patterns
--------------------------

Pattern 1:
The goal of this pattern should be to describe the potential states a system could be in for each function.

```powershell

        Describe 'Get-TargetResource' {
            # TODO: Complete Get-TargetResource Tests...
        }

        Describe 'Set-TargetResource' {
            # TODO: Complete Set-TargetResource Tests...
        }

        Describe 'Test-TargetResource' {
            # TODO: Complete Test-TargetResource Tests...
        }
```
Pattern 2:
The goal of this pattern should be to describe the potential states a system could be in so that the get/set/test cmdlets can be tested in those states. Any mocks that relate to that specific state can be included in the relevant Describe block. For a more detailed description of this approach please review #143

Add as many of these example 'states' as required to simulate the scenarios that the DSC resource is designed to work with, below a simple 'is in desired state' and 'is not in desired state' are used, but there may be more complex combinations of factors, depending on how complex your resource is.

```powershell

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
```


To see examples of the Unit/Integration tests in practice, see the xNetworking MSFT_xFirewall resource:
- [Unit Tests](https://github.com/PowerShell/xNetworking/blob/dev/Tests/Unit/MSFT_xFirewall.Tests.ps1)
- [Integration Tests](https://github.com/PowerShell/xNetworking/blob/dev/Tests/Integration/MSFT_xFirewall.Integration.Tests.ps1)
- [Resource DSC Configuration](https://github.com/PowerShell/xNetworking/blob/dev/Tests/Integration/MSFT_xFirewall.config.ps1)
