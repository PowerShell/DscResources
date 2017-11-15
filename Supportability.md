# PowerShell DSC Community Support Guidance

This document discusses the approach to support for DSC configurations and resources
published by the community.

This is a community guidance document and not intended to be a legal/support document.
For information on support programs available from Microsoft Corporation,
see [the following website](https://support.microsoft.com/en-us/allproducts)
and the category specific to the product or service where you use PowerShell.
Support beyond what is described in this page
might be available with those additional services.

## Are DSC resources supported by Microsoft

Microsoft supports PowerShell and the PowerShell Desired State Configuration
engine, Local Configuration Manager (LCM).

## What should I expect if I call Microsoft for support on a DSC Resource

When a new support case is opened and the focus is on DSC,
the person assisting the customer will attempt to resolve the issue
and if needed will include engineering support such as the PowerShell team.

The PowerShell team would determine if there is an issue with PowerShell or with LCM.
If help is needed beyond those areas the case might lead to guiding the customer
to open a new issue in that community project (GitHub repo),
a recommendation to engage a 3rd party company/organization that published the DSC Resource,
or escalation with other teams at Microsoft.
With community supported artifacts,
the case would be closed once a new issue has been submitted to the project.

## Who provides support for the technologies managed by DSC

The maintainers for DSC resources should clearly identify in the project README
if additional support is available.
An example would be if a Microsoft product or service engineering team
has agreed to extend their support to include DSC resources,
or if a 3rd party software company/organization provides support for DSC resources.

A template for documenting this will be available for community maintainers.
If support is not documented for a project,
then it defaults to unsupported.

## How does this apply to the naming of a resources

The naming of DSC resources includes an identifier of quality
as explained in the [Naming](Naming.md) informational page,
that is governed by the community of active DSC Resource contributors.

The expression of quality for a DSC Resource is a distinct metric from supportability.
The concepts of DSC Resource naming and support
should be considered unrelated.
