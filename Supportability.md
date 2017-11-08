# PowerShell DSC Community Support Guidance

This document discusses the approach to support for DSC configurations and resources
published by the community.

This is a community guidance document and not intended to be a legal/support document.
For information on support programs available from Microsoft Corporation,
see [the following website](https://support.microsoft.com/en-us/allproducts)
and the category specific to the product or service where you use PowerShell.
Support beyond what is described in this page
might be available with those additional services.

## Are DSC Resources supported by Microsoft

Microsoft supports PowerShell and Local Configuration Manager (LCM).
Helping customers with custom scripts is provided on a basis of best effort.
PowerShell scripts and DSC Resources can both be examples of custom scripts.

## What should I expect if I call Microsoft for support on a DSC Resource

When a new support case is opened and the focus is on DSC,
the person assisting the customer will attempt to resolve the issue
and if needed will include engineering support such as the PowerShell team.

The PowerShell team will determine if there is an issue with PowerShell or with LCM.
If help is needed with custom scripting it will be provided on a basis of best effort
and does not include specialized knowledge regarding the technology
managed by or implementation of community DSC Resources.

The support case might lead to guiding the customer
to open a new issue in that community project (GitHub repo),
a recommendation to engage a 3rd party company/organization that published the DSC Resource,
or escalation with other teams at Microsoft.

## Who provides support for the technologies managed by DSC

The maintainers for DSC Resources should clearly identify in the project README
if additional support is available.
An example would be if a Microsoft product or service engineering team
has agreed to extend their support to include DSC,
or if a 3rd party software company/organization provides support for a DSC Resource.

A template for documenting this will be available for community maintainers.
If support is not documented for a project,
then it defaults to unsupported.

## How does this apply to the naming of a resources

The naming of DSC Resources includes an identifier of quality
as explained in the [Naming](Naming.md) informational page,
that is governed by the community of active DSC Resource contributors.

The expression of quality for a DSC Resource is a distinct metric from supportability.
As described above, support from Microsoft
includes determining if there is an issue with PowerShell, an issue with LCM,
and best effort assistance with custom scripts.
Any additional support should be clearly documented in the project README.

The concepts of DSC Resource naming and support
should be considered unrelated.
