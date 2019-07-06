# DSC Resource Kit Maintainers

Maintainers are trusted contributors with knowledge in a resource module domain
who have [write access](https://help.github.com/articles/permission-levels-for-an-organization-repository/)
to one or more DSC Resource Kit repositories.

Maintainers have the power to:

1. `push`.
1. Merge pull requests.
1. Assign labels, milestones and people to [issues](https://guides.github.com/features/issues/).

## Table of Contents

- [Current Maintainers](#current-maintainers)
- [Rules](#rules)
- [Repeating Tasks](#reapeting-tasks)
- [Issue Workflow](#issue-workflow)
- [Pull Request Workflow](#pull-request-workflow)
  - [Abandoned Pull Requests](#abandoned-pull-requests)
- [Breaking Changes](#breaking-changes)

## Current Maintainers

Being a maintainer is a time-consuming task!
If you find you no longer have the time for this role, please let us know.
That helps us keep contributors up-to-date on what to expect for certain
repositories.
If you should be on this list but are not, please tag [@kwirkykat](https://github.com/kwirkykat)
in an issue or send [@katiedsc](https://twitter.com/katiedsc) a private
message on Twitter.

Resource modules listed in the DSC Resource Kit, except
PSDscResources, are not created or maintained by Microsoft.
These modules are maintained by community members.
Issues or questions relating to these resource modules should be raised
within the resource module's repository.

All repositories without dedicated maintainers are maintained by the
current DSC Resource Kit owners, Katie Keim ([@kwirkykat](https://github.com/kwirkykat))
and Mariah Breakey ([@mbreakey3](https://github.com/mbreakey3)).

| Repository | Maintainer(s) |
| ---------- | ------------- |
| [ActiveDirectoryCSDsc](https://github.com/PowerShell/ActiveDirectoryCSDsc) | Daniel Scott-Raynsford ([@PlagueHO](https://github.com/PlagueHO)) <br/> Jason Ryberg ([@devopsjesus](https://github.com/devopsjesus)) |
| [AuditPolicyDsc](https://github.com/PowerShell/AuditPolicyDsc) | Adam Haynes ([@athaynes](https://github.com/athaynes)) |
| [CertificateDsc](https://github.com/PowerShell/CertificateDsc) | Daniel Scott-Raynsford ([@PlagueHO](https://github.com/PlagueHO)) |
| [ComputerManagementDsc](https://github.com/PowerShell/ComputerManagementDsc) | Tyson Hayes ([@tysonjhayes](https://github.com/tysonjhayes)) <br/> Daniel Scott-Raynsford ([@PlagueHO](https://github.com/PlagueHO)) |
| [DFSDsc](https://github.com/PowerShell/DFSDsc) | Daniel Scott-Raynsford ([@PlagueHO](https://github.com/PlagueHO)) |
| [DscResources](https://github.com/PowerShell/DscResources) | Katie Keim ([@kwirkykat](https://github.com/kwirkykat)) <br/> Zachary Alexander ([@zjalexander](https://github.com/zjalexander)) |
| [DscResource.Tests](https://github.com/PowerShell/DscResource.Tests) | Katie Keim ([@kwirkykat](https://github.com/kwirkykat)) <br/> Mariah Breakey ([@mbreakey3](https://github.com/mbreakey3)) |
| [FileContentDsc](https://github.com/PlagueHO/FileContentDsc) | Daniel Scott-Raynsford ([@PlagueHO](https://github.com/PlagueHO)) |
| [FSRMDsc](https://github.com/PlagueHO/FSRMDsc) | Daniel Scott-Raynsford ([@PlagueHO](https://github.com/PlagueHO)) |
| [iSCSIDsc](https://github.com/PlagueHO/iSCSIDsc) | Daniel Scott-Raynsford ([@PlagueHO](https://github.com/PlagueHO)) |
| [NetworkingDsc](https://github.com/PowerShell/NetworkingDsc) | Tyson Hayes ([@tysonjhayes](https://github.com/tysonjhayes)) <br/> Daniel Scott-Raynsford ([@PlagueHO](https://github.com/PlagueHO)) <br/> Mike Beggs ([@39Delta](https://github.com/39Delta)) |
| [OfficeOnlineServerDsc](https://github.com/PowerShell/OfficeOnlineServerDsc) | Nik Charlebois ([@NikCharlebois](https://github.com/NikCharlebois)) |
| [PSDscResources](https://github.com/PowerShell/PSDscResources) | Mariah Breakey ([@mbreakey3](https://github.com/mbreakey3)) <br/> Katie Keim ([@kwirkykat](https://github.com/kwirkykat)) <br/> Mike Hendrickson ([@mhendric](https://github.com/mhendric)) <br/> Daniel Scott-Raynsford ([@PlagueHO](https://github.com/PlagueHO)) |
| [SecurityPolicyDsc](https://github.com/PowerShell/SecurityPolicyDsc) | Jason Walker ([@jcwalker](https://github.com/jcwalker)) |
| [SharePointDsc](https://github.com/PowerShell/SharePointDsc) | Yorick Kuijs ([@ykuijs](https://github.com/YKuijs)) <br/> Nik Charlebois ([@NikCharlebois](https://github.com/NikCharlebois)) |
| [SqlServerDsc](https://github.com/PowerShell/SqlServerDsc) | Johan Ljunggren ([@johlju](https://github.com/johlju)) |
| [StorageDsc](https://github.com/PowerShell/StorageDsc) | Daniel Scott-Raynsford ([@PlagueHO](https://github.com/PlagueHO)) |
| [SystemLocaleDsc](https://github.com/PowerShell/SystemLocaleDsc) | Daniel Scott-Raynsford ([@PlagueHO](https://github.com/PlagueHO)) |
| [WmiNamespaceSecurityDsc](https://github.com/PowerShell/WmiNamespaceSecurityDsc) | --- |
| [WSManDsc](https://github.com/PlagueHO/WSManDsc) | Daniel Scott-Raynsford ([@PlagueHO](https://github.com/PlagueHO)) |
| [xActiveDirectory](https://github.com/PowerShell/xActiveDirectory) | Johan Ljunggren ([@johlju](https://github.com/johlju)) <br/> Jan-Hendrik Peters ([@nyanhp](https://github.com/nyanhp)) <br/> Jason Ryberg ([@devopsjesus](https://github.com/devopsjesus)) <br/> Ryan Christman ([rchristman89](https://github.com/rchristman89)) |
| [xAzure](https://github.com/PowerShell/xAzure) | Chase Wilson ([@chasewilson](https://github.com/chasewilson)) <br/> Jason Ryberg ([@devopsjesus](https://github.com/devopsjesus)) |
| [xAzurePack](https://github.com/PowerShell/xAzurePack) | --- |
| [xBitlocker](https://github.com/PowerShell/xBitlocker) | Mike Hendrickson ([@mhendric](https://github.com/mhendric)) |
| [xChrome](https://github.com/PowerShell/xChrome) | --- |
| [xCredSSP](https://github.com/PowerShell/xCredSSP) | --- |
| [xDatabase](https://github.com/PowerShell/xDatabase) | --- |
| xDefender | DEPRECATED - Replaced by [WindowsDefenderDsc](https://www.powershellgallery.com/packages/WindowsDefenderDsc). Note: WindowsDefenderDsc is not part of DSC Resource Kit. |
| [xDhcpServer](https://github.com/PowerShell/xDhcpServer) | Mike Beggs ([@39Delta](https://github.com/39Delta)) |
| xDisk | DEPRECATED - Replaced by [StorageDsc](https://github.com/PowerShell/StorageDsc) |
| [xDismFeature](https://github.com/PowerShell/xDismFeature) | --- |
| [xDnsServer](https://github.com/PowerShell/xDnsServer) | Jason Patton ([@japatton](https://github.com/japatton)) <br /> Chris Dent ([@indented-automation](https://github.com/indented-automation)) |
| [xDscDiagnostics](https://github.com/PowerShell/xDscDiagnostics) | --- |
| [xDSCResourceDesigner](https://github.com/PowerShell/xDSCResourceDesigner) | --- |
| [xExchange](https://github.com/PowerShell/xExchange) | Mike Hendrickson ([@mhendric](https://github.com/mhendric)) |
| [xFailOverCluster](https://github.com/PowerShell/xFailOverCluster) | Johan Ljunggren ([@johlju](https://github.com/johlju)) |
| [xFirefox](https://github.com/PowerShell/xFirefox) | Chase Wilson ([@chasewilson](https://github.com/chasewilson)) |
| [xHyper-V](https://github.com/PowerShell/xHyper-V) | Anthony Romano ([@aromano2](https://github.com/aromano2)) |
| [xInternetExplorerHomePage](https://github.com/PowerShell/xInternetExplorerHomePage) | --- |
| [xJea](https://github.com/PowerShell/xJea) | --- |
| [xMySql](https://github.com/PowerShell/xMySql) | --- |
| [xPendingReboot](https://github.com/PowerShell/xPendingReboot) | Brian Wilhite ([@bcwilhite](https://github.com/bcwilhite)) <br/> Nehru Ali ([@nehrua](https://github.com/nehrua)) |
| [xPhp](https://github.com/PowerShell/xPhp) | --- |
| xPowerShellExecutionPolicy | DEPRECATED - Migrated to [ComputerManagementDsc](https://github.com/PowerShell/ComputerManagementDsc) |
| [xPSDesiredStateConfiguration](https://github.com/PowerShell/xPSDesiredStateConfiguration) | Mike Hendrickson ([@mhendric](https://github.com/mhendric)) <br/> Daniel Scott-Raynsford ([@PlagueHO](https://github.com/PlagueHO)) |
| [xRemoteDesktopAdmin](https://github.com/PowerShell/xRemoteDesktopAdmin) | --- |
| [xRemoteDesktopSessionHost](https://github.com/PowerShell/xRemoteDesktopSessionHost) | Leo D'Arcy ([@ld0614](https://github.com/ld0614)) |
| [xRobocopy](https://github.com/PowerShell/xRobocopy) | --- |
| [xSafeHarbor](https://github.com/PowerShell/xSafeHarbor) | --- |
| [xSCDPM](https://github.com/PowerShell/xSCDPM) | Leo D'Arcy ([@ld0614](https://github.com/ld0614)) |
| [xSCOM](https://github.com/PowerShell/xSCOM) | Leo D'Arcy ([@ld0614](https://github.com/ld0614)) |
| [xSCSMA](https://github.com/PowerShell/xSCSMA) | --- |
| [xSCSPF](https://github.com/PowerShell/xSCSPF) | --- |
| [xSCSR](https://github.com/PowerShell/xSCSR) | --- |
| [xSCVMM](https://github.com/PowerShell/xSCVMM) | Jan-Hendrik Peters ([@nyanhp](https://github.com/nyanhp)) |
| xSmbShare | DEPRECATED - Migrated to [ComputerManagementDsc](https://github.com/PowerShell/ComputerManagementDsc) |
| xSqlPs | DEPRECATED - Replaced by [SqlServerDsc](https://github.com/PowerShell/SqlServerDsc) |
| [xSystemSecurity](https://github.com/PowerShell/xSystemSecurity) | --- |
| xTimeZone | DEPRECATED - Migrated to [ComputerManagementDsc](https://github.com/PowerShell/ComputerManagementDsc) |
| [xWebAdministration](https://github.com/PowerShell/xWebAdministration) | Tyson Hayes ([@tysonjhayes](https://github.com/tysonjhayes)) <br/> Reggie Gibson ([@regedit32](https://github.com/regedit32)) |
| [xWebDeploy](https://github.com/PowerShell/xWebDeploy) | --- |
| [xWindowsEventForwarding](https://github.com/PowerShell/xWindowsEventForwarding) | --- |
| [xWindowsRestore](https://github.com/PowerShell/xWindowsRestore) | --- |
| [xWindowsUpdate](https://github.com/PowerShell/xWindowsUpdate) | --- |
| [xWinEventLog](https://github.com/PowerShell/xWinEventLog) | DEPRECATED - Migrated to [ComputerManagementDsc](https://github.com/PowerShell/ComputerManagementDsc) |
| [xWordPress](https://github.com/PowerShell/xWordPress) | --- |

## Rules

If you are maintainer, please follow these rules:

1. **DO** take care of pull requests in a timely manner.
1. **DO** ensure that each contributor has signed a valid Contributor License
  Agreement (CLA).
1. **DO** reply to new issues and pull requests (after you finish reviewing and
  everything looks good to you, leave a comment like "Looks good to me" or "LGTM"
  so we know that someone has looked at it and approved it).
1. **DO** make sure contributors are following the [contributor guidelines](https://github.com/PowerShell/DscResources/blob/master/CONTRIBUTING.md).
1. **DO** ask people to resend a pull request, if it targets [the wrong branch](CONTRIBUTING.md#lifecycle-of-a-pull-request).
1. **DO** require people to write Pester tests for all new/changed functionality.
1. **DO** wait for the [CI system](CONTRIBUTING.md#appveyor) build to pass for
  pull requests.
1. **DO** encourage contributors to refer to issues in PR title/description
  (e.g. `Fixes #11`, or `Closes #11`). Edit title if necessary.
1. **DO** encourage contributors to create meaningful titles for all PRs. Edit
  title if necessary.
1. **DO** verify that all contributors are following the [style guidelines](https://github.com/PowerShell/DscResources/blob/master/StyleGuidelines.md).
1. **DO** verify compliance with any third party code license terms (e.g.,
  requiring attribution, etc.) if the contribution contains third party code.

1. **DON'T** merge pull requests where the CLA status check (`license/cla`) is
  pending or the CLA status check is missing (updated by Microsoft CLA bot).
1. **DON'T** merge pull requests to **master** branch.
1. **DON'T** merge pull requests with a failed CI build.
1. **DON'T** merge pull requests that do not [include all meaningful changes](CONTRIBUTING.md#lifecycle-of-a-pull-request)
  under the **Unreleased** section in the repository's `README.md` or `CHANGELOG.md`.
1. **DON'T** merge your own pull requests before they are reviewed by someone else.
    - If there is **no one** else to review your pull request, please wait **24**
      hours to merge it in case anyone comes along and has a comment.

## Repeating Tasks

If you are a maintainer these are the repeating tasks that need to be done
regularly.

### Check copyright information

Each year, before that year's first DSC Resource Kit release, the
copyright information should be updated in the module's
module manifest (the .psd1 file) and in the LICENSE file.

#### Module manifest

This is how the copyright information looks for the year 2017.

```powershell
# Copyright statement for this module
Copyright = '(c) 2017 Microsoft Corporation. All rights reserved.'
```

From the beginning of October 2018, the copyright information should
be updated as below.

```powershell
# Copyright statement for this module
Copyright = '(c) Microsoft Corporation. All rights reserved.'
```

#### License

This is how the copyright information looks for the year 2017.

```powershell
Copyright (c) 2017 Microsoft Corporation
```

From the beginning of October 2018, the copyright information should
be updated as below.

```powershell
Copyright (c) Microsoft Corporation. All rights reserved.
```

#### License File contents

The LICENSE file should appear as shown in [LICENSE](https://github.com/PowerShell/DscResources/blob/master/LICENSE),
indentation included.

## Issue Workflow

1. Someone creates an issue.
1. A maintainer assigns one of the following labels: ```bug```, ```enhancement```,
  ```discussion```, ```question```
   1. In some cases, other special labels may be used (e.g. ```module proposal```
     for issues requesting new DSC resource modules in the DscResources repository)
   1. If the issue is a duplicate of another issue, the maintainer adds the ```duplicate```
     label, references the issue this one is a duplicate of, and closes the issue.
   1. If the issue is external to your module, the maintainer adds the ```external```
     label, comments with an explanation of why the issue will not be fixed, and
     closes the issue.
   1. If for some other reason an issue should not be fixed, the maintainer adds
     the ```not fixed``` label, comments with an explanation of why the issue will
     not be fixed, and closes the issue.
1. A maintainer assigns the ```help wanted``` label to let contributors know this
  issue needs someone else to look at it
1. Once a contributor volunteers to work on the issue, the maintainer removes the
  ```help wanted``` label, adds the ```in progress``` label, and assigns the issue
  to the volunteer.
1. Once issue is fixed, the maintainer removes the ```in progress``` label and
  closes the issue.

## Pull Request Workflow

1. A contributor opens a pull request.
1. The contributor ensures that their pull request passes the [CI system](CONTRIBUTING.md#appveyor)
  build.
   - If the build fails, a maintainer adds the `waiting for code fix` label to the
     pull request. The contributor can then continue to update the pull request
     until the build passes.
1. Once the build passes, the maintainer either reviews the pull request immediately
  or adds the ```needs review``` label.
1. A maintainer or trusted contributor reviews the pull request code.
   - If the contributor does not meet the reviewer's standards, the reviewer makes
     comments. A maintainer then removes the the ```needs review``` label and adds
     the ```waiting for code fix``` label. The contributor must address the comments
     and repeat from step 2.
   - If the contributor meets the reviewer's standards, the reviewer comments
   that they are satisfied. A maintainer then removes the the ```needs review```
   label.
1. Once the code review is completed, a maintainer merges the pull request.

### Pull Requests waiting for CLA pass

Please remind the contributor that a PR cannot be reviewed or merged without the
CLA being signed.
A pull request pull requests that haven't passes the status check `license/cla`
(from the Microsoft CLA bot) for **more than 2 weeks** without word from the
author should be closed.

### Abandoned Pull Requests

A pull request with the label `waiting for code fix` or `waiting for author response`
for **more than 2 weeks** without word from the author is considered abandoned.

In these cases:

1. Ping the author of PR to remind him of pending changes.
   - If the contributor responds, it's no longer an abandoned pull request, proceed
   as normal.
1. If the contributor does not respond **within a week**:
   - If the reviewer's comments are very minor, merge the change, fix the code
     immediately, and create a new PR with the fixes addressing the minor comments.
   - If the changes required to merge the pull request are significant but needed,
     create a new branch with the changes and open an issue to merge the code into
     the dev branch. Mention the original pull request ID in the description of
     the new issue and close the abandoned pull request.
   - If the changes in an abandoned pull request are no longer needed (e.g. due
     to refactoring of the codebase or a design change), simply close the pull request.

## Breaking Changes

Breaking changes may be accepted if they make a resource better.
Breaking changes usually include:

- Adding a new mandatory parameter
- Changing an existing parameter
- Removing an existing parameter
- Fundamentally changing an existing functionality of a resource

If you need to accept a breaking change in your module please please ensure:

1. Any issues or PRs associated with the breaking change include the
  ```breaking change``` label.
1. At least one of the bullet points in the updated release notes starts with
  'BREAKING CHANGE:'.
1. The title of the PR that includes the breaking change starts with 'BREAKING CHANGE:'.

Upon release, the version of a module with a breaking change will be updated as such:

- Modules that still have the x... naming are incremented by a full version number
  if there is a breaking change (2.2.0.0 --> 3.0.0.0). All of these modules are
  still considered to be in the 'preview' or 'experimental' phase.
- Modules that have the ...Dsc naming but are still in the 'preview' phase (prior
  to 1.0.0.0) are incremented only by a sub-version regardless of breaking changes
  until they are ready to come out of preview (0.3.0.0 --> 0.4.0.0).
- Modules that have the ...Dsc naming and are out of the 'preview' phase (1.0.0.0
  and after) are incremented by a full version number (2.2.0.0 --> 3.0.0.0).
