# PowerShell DSC Community Support Guidance

This document discusses the approach to support for DSC configurations and resources
published by the community.

This is a community guidance document and not intended to be a legal/support document.
For information on support contracts with Microsoft Corporation,
see [the following website](https://support.microsoft.com/en-us/allproducts).

## Are DSC Resources supported by Microsoft

Microsoft supports PowerShell and the DSC engine, Local Configuration Manager (LCM).
This support includes best effort approach to helping customers with custom scripts.
PowerShell scripts and DSC Resources can both be examples of custom scripts.

## What should I expect if I call Microsoft for support on a DSC Resource

When a new support case is opened, and the focus is on DSC
the person assisting the customer will attempt to resolve the issue,
and if needed will include the PowerShell team.
The PowerShell team will determine if there is an issue with PowerShell, LCM,
or if help is needed with custom scripting.

**If the custom scripting applies to a Microsoft product or service,**
the support case may need to include resources from those teams,
especially if specialized technical knowledge is required
or if there might be an issue with that product or service.

**If custom scripting involves third party software**
**(software from a commercial software company other than Microsoft),**
it might be required for the customer to also open a support case with that organization.

**If the custom scripting involves a community maintained Open Source solution,**
the support case might lead to guiding the customer to open a new issue
in that project (such as in a GitHub repo.)

In each of these cases, the consistent approach is to support PowerShell, support LCM,
provide best effort support for custom scripts,
and engage the appropriate specialized resources
for supporting the technology that is managed by DSC.

## How does this apply to the naming of a resources

The naming of DSC Resources includes an identifier of quality
as explained in the [Naming](Naming.md) informational page,
that is governed by the community of active DSC Resource contributors.

The expression of quality for a DSC Resource is a distinct metric from supportability.
As described above, support from Microsoft
includes determining if there is an issue with PowerShell, an issue with LCM,
best effort assistance with custom scripts,
as well as engaging or recommending specialized resources
to assist with the product or service that is being managed by DSC.

The concepts of DSC Resource naming and support from Microsoft
should be considered unrelated,
as Microsoft will make best effort to support customers using custom DSC Resources.

## Narrative example

*The example below demonstrates that best effort approach to supporting custom scripts
and dependence on subject matter expertise,
is independent of the community-governed expression of quality for DSC Resources
(the two concepts should be considered unrelated).*

An organization uses DSC to manage Active Directory, a Microsoft identity platform.
The Operations team leverages xActiveDirectory,
a DSC Resource module that is maintained by the community
that is named with an "x" because it is being actively developed
and has not yet been verified by the community as meeting the guidelines
to be a High Quality Resource Module.
The organization encounters an issue in configuring their servers
and opens a support case with Microsoft.
The case is escalated to the PowerShell team.
The development team for DSC validates that PowerShell and LCM are behaving as expected
and assists the customers in verifying
that the scripts within the DSC resources are behaving as expected.

The case is also escalated to the Active Directory team.
The Active Directory team validates that Active Directory is behaving as expected
when managed using PowerShell cmdlets (in the same security context as DSC).

Together, the teams work with the customer to resolve the issue.
