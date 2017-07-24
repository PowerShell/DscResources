# Community Call 09/15/16 Notes 
A full recording of this call is available [here](https://youtu.be/tx18fsWjcQU).

Feedback for this call can be posted in [issue #194](https://github.com/PowerShell/DscResources/issues/194).

## Call Summary
- [Labels and Waffle Dashboard](#labels-and-waffle-dashboard)
- [Documentation Updates](#documentation-updates)
- [Upcoming Release](#upcoming-release)
- [New Resource Modules](#new-resource-modules)
- [xPSDesiredStateConfiguration](#xpsdesiredstateconfiguration)
- [xWebDeploy Problems](#xwebdeploy-problems)
- [Test Templates](#test-templates)

### Labels and Waffle Dashboard
- Labels have been updated to be the same for all repositories
  - Except SharePointDsc because Brian seems to have his own process which is working well
- Updated waffle dashboard is available [here](https://waffle.io/powershell/dscresources)

### Documentation Updates
- Large updates have been made to the following documents:
  - [Contributing](https://github.com/PowerShell/DscResources/blob/master/CONTRIBUTING.md)
    - Whole document has been rewritten
    - Please read the new [Reviewing a Pull Request](https://github.com/PowerShell/DscResources/blob/master/CONTRIBUTING.md#reviewing-pull-requests) section - *anyone* can review pull requests!
  - [Getting Started with GitHub](https://github.com/PowerShell/DscResources/blob/master/GettingStartedWithGitHub.md) 
    - Resolve merge conflicts section has been updated
    - Thank you to Johan Ljunggren ([@johlju](https://github.com/johlju)) for these updates
  - [Getting Started with Pester](https://github.com/PowerShell/DscResources/blob/master/GettingStartedWithPester.md)
    - New document to help new contributors with testing
    - Thank you to Adam Hayes ([@athaynes](https://github.com/athaynes)) for this document

### Upcoming Release
- September 21
- 7-8 modules currently on track to be released:
  - SharePointDsc
  - xExchange
  - xPSDesiredStateConfiguration
  - xSqlServer
  - xStorage
  - xSystemSecurity
  - xTimeZone
  - xWebAdministration

### New Resource Modules
- [OfficeOnlineServerDsc](https://github.com/PowerShell/OfficeOnlineServerDsc) by Brian Farnhill ([@BrianFarnhill](https://github.com/BrianFarnhill))
- [SystemLocaleDsc](https://github.com/PowerShell/SystemLocaleDsc) by Daniel Scott-Raynsford ([@PlagueHO](https://github.com/PlagueHO))

### xPSDesiredStateConfiguration
- DSC team is focusing on upgrading this module to a high quality resource module
- Partial xPSDesiredStateConfiguration HQRM will be released before the end of September. This partial release will contain:
  - Group
  - Service
  - User
  - WindowsOptionalFeature
  - WindowsPackageCab
- HQRM module will be renamed 'PSDsc' since we cannot named it PSDesiredStateConfiguration since the HQRM cannot cover all the resources in the in-box PSDesiredStateConfiguration module
- Will the HQRM xPSDesiredStateConfiguration be the first cross-platform module?
  - Not a focus of the team right now

### xWebDeploy Problems
- Last blocking issue in the DSC Resource Kit
- PSSA team says the problem is coming from editing the path in the common tests
- Still investigating

(This blocking issue now has a workaround and has been closed! Thank you Daniel Krebs ([@Dan1el42](https://github.com/Dan1el42))!)

### Test Templates
- General consensus is to leave the all-encapsulating InModuleScope in the unit test template until we have some updates from Pester
- Test templates not set in stone. We are still working on them.
