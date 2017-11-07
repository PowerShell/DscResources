# DSC Resource Naming

This document clarifies the naming convention for DSC Resource Modules.

- [Module Naming](##module-naming)
- ["Dsc" Suffix](##dsc-suffix)
- [High Quality Resource Module tag (HQRM)](##high-quality-resource-module)

*Previously documented conventions:*

- [(Deprecated) Expiremental (xResource)](##deprecated-expiremental)
- [(Deprecated) Community created (cResource)](##deprecated-community-created)

## Quality Governance

The community of Open Source contributors holds each other,
and Microsoft, accountable to quality through a process that includes:
- Code review prior to listing in [DSC Resource](http://github.com/powershell/dscresources) repo
    - Includes an expectation of [project structure](Contributing.md##developing-a-new-resource), including [documentation](Contributing.md##writing-documentation), [tests](Contributing.md###write-tests) and [CI](Contributing.md###tests-in-appveyor) process to revalidate at every push to source
- Contributor community monthly Skype call
- Established baseline of "High Quality" to set goals for contributors seeking best practice guidance

The PowerShell team is a stakeholder in the community.
Anyone contributing to or even consuming these projects can participate in improving
the DSC Resources available by providing feedback,
calling out Issues, or assist in documenting new quality baselines,
see [high quality DSC resource guidelines](HighQualityModuleGuidelines.md)

## Module Naming

When possible, a DSC resource can be combined with PowerShell functions
in a single module.
The module is scoped to a scenario and exports commands for general use
as well as DSC resources to declaratively manage the same components.

If no module exists within the scope of the scenario,
there is no need to append a special identifier in the name.
The module should include the metadata tag "DSC Resource"
to clearly identify it in the [gallery](http://powershellgallery.com).

## Dsc Suffix

When creating a module for DSC resources that will be paired with an existing PowerShell module,
the best approach is to combine the original module name with the suffix "Dsc".
This clearly identifies intent to align with the existing module.

Even with the "Dsc" suffix,
the module should include the metadata tag "DSC Resource"
to clearly identify it in the [gallery](http://powershellgallery.com).

## High Quality Resource Module

The community reviews modules [submitted to the community call](CommunityAgenda.md)
in order to determine if they meet an agreed-upon level of quality.
These modules follow the [high quality DSC resource guidelines](HighQualityModuleGuidelines.md).
This means the module strictly meets the community governed requirements
for development of a DSC resource.

HQRM should be viewed as adherence to best practices and can be included as a tag
throughout the entire life of development as long as the guidelines are followed.
It is not an "end state", and is unrelated to [supportability](Supportability.md).

Modules that meet HQRM requirements should be tagged in their module manifest with "HQRM"
in addition to the metdata tag "DSC Resource"
so both properties can be easily discovered in the [gallery](http://powershellgallery.com).

## (Deprecated) Experimental

When DSC was originally introduced,
it was communicated that new modules should be prefixed with an "x"
to help identify that the work might not be suitable for use in a production environment.

The community has now matured and guidelines exist to hold project maintainers accountable
through the use of CI process where tests are required and the results are publicly available.
Anyone that would like to evaluate the quality of a module can view the project documentation,
code, tests, and test results, to understand if the work is suitable for their environment.

The "x" prefix is no longer required.
Resources that include the prefix are free to deprecate the convention going forward.

The existing work will remain available in the [gallery](http://powershellgallery.com)
so there is no risk to existing Configurations.
For Configurations that use modules that include an "x",
see the project sites for communication from the maintainers about when a name change
could occur.

## (Deprecated) Community Created

Similar to the "x" prefix,
at the launch of DSC there was communication that people contributing
their own DSC resources prefix it with "c".
This was because the resource modules were distributed via TechNet.
Since we have moved to GitHub, this requirement is no longer valid.

## Versioning

In addition to naming, contributors should express incremental changes
through proper versioning from release to release.
The recommended versioning strategy for DSC projects is [semantic versioning](http://semver.org/).

## Support

The concepts of Naming and supportability are unrelated.
For details see the [supportability](Supportability.md) informational page.
