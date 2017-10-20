# DSC Resource Naming

This document clarifies the naming convention for DSC Resource Modules.
From least to most trustworthy, these prefixes are:

1. [Active ("x" prefix)](##active)
1. [Stable ("DSC" suffix)](##stable)
1. [High Quality Resource Module (HQRM tag)](##high-quality-resource-module)

*Note:* [(Deprecated) Community created (cResource)](##deprecated-community-created)

## Quality Governance

The community of Open Source contributors holds each other,
and Microsoft, accountable to quality through a process that includes:
- Code review prior to listing as submodule in [DSC Resource](http://github.com/powershell/dscresources) repo
    - Includes an expectation of [project structure](Contributing.md##developing-a-new-resource), including [documentation](Contributing.md##writing-documentation), [tests](Contributing.md###write-tests) and [CI](Contributing.md###tests-in-appveyor) process to revalidate at every push to source
- Contributor community monthly Skype call
- Established baseline of "High Quality" to set goals for contributors seeking best practice guidance

The PowerShell team is a stakeholder in the community.
Anyone contributing to or even consuming these projects can participate in improving
the DSC Resources available by providing feedback,
calling out Issues, or assist in documenting new quality baselines,
see [high quality DSC resource guidelines](HighQualityModuleGuidelines.md)

## Active

The "x" prefix designates a branch of a project that is under active development.
Frequent releases are to be expected
and major releases that include [breaking changes](Contributing.md##breaking-changes)
can be expected to occur.
A project might always have an Active branch,
and make Active branch releases to the [PowerShell Gallery](http://www.powershellgallery.com)
using the "x" prefix while also having branches in other categories (such as Stable).
New projects might only have an Active release, so they will choose to have the "Master" branch
as the Active branch until the maintainer decides otherwise.

The [HQRM](HighQualityModuleGuidelines.md) tag can be applied to Active branch
releases if all guidelines are met.
In other words, a developer of a DSC Resource can meet all the requirements for HQRM
in the Active branch and continue with frequent releases, as long as the releases
always meet the community guidelines.

## Stable

These modules have no prefix, but they are suffixed with "DSC".
The "DSC" suffix indicates a branch of a project that is the Stable release
(likely named the "Master" branch).
A contributor that releases a resource to the [PowerShell Gallery](http://www.powershellgallery.com)
with the "DSC" suffix is indicating to the public
that the code is ready to be consumed in a production environment.
Less frequent releases are to be expected especially across major version releases.

The same project will likely have releases to the Gallery from both Active and Stable branches,
and both could include the [HQRM](HighQualityModuleGuidelines.md) tag if all guidelines are met.

*Note:* it is best practice to download (save) and review any code from a public gallery or project
site before use in a production environment.

## High Quality Resource Module

The community reviews modules [submitted to the community call](CommunityAgenda.md)
in order to determine if they meet the quality bar.
These modules follow the [high quality DSC resource guidelines](HighQualityModuleGuidelines.md).
This means the module strictly meets the community governed requirements
for development of a DSC resource.
Modules that have been reviewed by the community
and meet the bar will be listed on this folder of the DSC Resources repository
and should be tagged in their module manifest with "HQRM"
so they are easily discovered in the Gallery.

## (Deprecated) Community Created

At the launch of DSC,
we requested that people contributing their own DSC resources prefix it with "c".
This was because the resource modules were distributed via TechNet.
Since we have moved to GitHub, this requirement is no longer valid.
You might still see a few cResources in the wild
but they hopefully will be updated to use an "x" in future releases.

## Versioning

In addition to naming, contributors should express incremental changes
through proper versioning from release to release.
The recommended versioning strategy for DSC projects is [semantic versioning](http://semver.org/).

## Support

The concepts of Naming and supportability are unrelated.
For details see the [supportability](Supportability.md) informational page.
