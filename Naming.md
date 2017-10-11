This document clarifies the naming convention for DSC Resource Modules.
From least to most trustworthy, these prefixes are:

1. [Unsupported (xResource)](#unsupported)
1. [Community Supported (HQRM)](#community-supported)
1. [Microsoft Supported](#microsoft-supported)
1. [(Deprecated) Community created (cResource)](#deprecated-community-created)

## Unsupported
The "x" prefix means a module is "experimental". 
It comes with no support guarantee whatsoever.
Resource module authors should remove the "x" when they are ready to have a 1.0 version that is fit for public consumption.

## Community Supported
These modules have no prefix, but they are suffixed with "DSC".
These modules are **not** officially supported by Microsoft.
However, there is sufficient interest in this module such that you might get some help if you post a GitHub issue.
The community reviews modules [submitted to the community call](CommunityAgenda.md) in order to determine if they meet the quality bar.
These modules follow the [high quality DSC resource guidelines](https://github.com/PowerShell/DscResources/blob/master/HighQualityModuleGuidelines.md).
This means the module has proper test coverage and follows Microsoft best practices for development of a DSC resource.
Modules which have been reviewed by the community and meet the bar will be listed on this repository. 

## Microsoft Supported
The modules in [/PowerShell/DscResources/DscResources](https://github.com/PowerShell/DscResources/tree/master/DscResources) are supported by Microsoft.

## (Deprecated) Community Created
At the launch of DSC, we requested that people contributing their own DSC resources prefix it with "c".
This was because the resource modules were distributed via TechNet.
Since we have moved to GitHub, this requirement is no longer valid. 
You might still see a few cResources in the wild. They should be treated as unsupported resources, as if they started with an "x".
