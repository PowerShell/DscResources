# DSC Resource Testing Guidelines

General Rules
-------------

 * Each DSC module should contain the following Test folder structure:

       Tests

       |---Unit

       |---Integration

 * The Tests\Unit folder must contain a Test Script for each DSC Resource in the DSC Module with the filename MSFT_<ResourceName>.tests.ps1.
 * The Tests\Integration folder should, whenever possible, contain a Test Script for each DSC Resource in the DSC Module with the filename MSFT_<ResourceName>.integration.tests.ps1.
 * Each Test Script should contain [Pester](https://github.com/pester/Pester) based tests.
 * Integration tests should be created when possible, but for some DSC resources this may not be possible. For example, when integration tests would cause the testing computer configuration to be damaged. 
 * Unit and Integration tests should be created using the Template files that are located in the [Tests.Template](Tests.Template) folder in this repository.
 * The Unit and Integration test templates require that Git.exe be installed and can be found in the %PATH% on the testing computer.
 * The Unit and Integration test templates will automatically download or update the [DSCResource.Tests repository](https://github.com/PowerShell/DscResource.Tests) using Git.exe to the DSC Module folder.
 * Ensure that the .gitignore file for the resource module contains **DSCResource.Tests** so that this folder is not accidentally included in a commit to your resource repository. 

Creating DSC Resource Unit Test Instructions
============================================
 1. Copy the \Tests.Template\unit_template.ps1 to the \Tests\Integration\ folder and rename to MSFT_x<ResourceName>.tests.ps1
 2. Open MSFT_x<ResourceName>.tests.ps1 and customize TODO sections.

Creating DSC Resource Integration Test Instructions
===================================================
 1. Copy the \Tests.Template\integration_template.ps1 to \Tests\Integration\ folder and rename MSFT_x<ResourceName>.Integration.tests.ps1
 2. Open MSFT_x<ResourceName>.Integration.tests.ps1 and customize TODO sections.
 3. Copy the \Tests.Template\integration_comfig_template.ps1 to \Tests\Integration\ folder and rename MSFT_x<ResourceName>.config.ps1 
 4. Open MSFT_x<ResourceName>.config.ps1 and customize TODO sections.
 
Running Tests Locally
=====================
All tests are automatically run via AppVeyor when the repository is updated. However, it is recommended that all tests be run locally before being commited.

Requirements for running all tests locally:
 1. Git is installed and the Git.exe can be found in the %PATH% variable.
 2. The latest [Pester Module](https://github.com/pester/Pester) is installed, either manually or via PowerShellGet.
 3. An internet connection is available so that the DSCResource.Tests repository can be downloaded using Git. This only needs to be done once and so is only required the first time the tests are run.
 
Example Tests
=============
To see examples of the Unit/Integration tests in practice, see the xNetworking MSFT_xFirewall resource:
- [Unit Tests](https://github.com/PowerShell/xNetworking/blob/dev/Tests/Unit/MSFT_xFirewall.Tests.ps1)
- [Integration Tests](https://github.com/PowerShell/xNetworking/blob/dev/Tests/Integration/MSFT_xFirewall.Integration.Tests.ps1)
- [Resource DSC Configuration](https://github.com/PowerShell/xNetworking/blob/dev/Tests/Integration/MSFT_xFirewall.config.ps1)
