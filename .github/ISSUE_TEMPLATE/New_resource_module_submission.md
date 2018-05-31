---
name: New resource module submission
about: You may list you resource module in Dsc Resource Kit when your resource module pass the [Quality Governance](https://github.com/PowerShell/DscResources/blob/master/Naming.md#quality-governance).
---

<!--
    Please replace all [] with your information and fill in the task list.
-->

### New resource module submission

**Name:** [name of resource module]

**Repository URL:** [GitHub URL]

**Short description:** [Short description of your resource module]

### New resource module submission task list

*This task list can be filled in after the issue has been submitted.*

* [ ] Pass the [Quality Governance](https://github.com/PowerShell/DscResources/blob/master/Naming.md#quality-governance)
* [ ] Pull request is sent in (see next section).
* [ ] The new module submission in ready for community review.

#### Steps that pull request should include

* [ ] Added submodule using `git submodule add https://github.com/<accountname>/<reponame> DscResources/<reponame>`.
* [ ] Updated resource module list in Maintainers.md.

### Community acceptance

<!--
    This should be filled in by the community. Preferably this should be
    added as a comment to a new module submission in the future.
-->
**Community reviewers: Please submit a comment on the issue for each box that are checked so the
community know who accepted the item.**

The new resource module:

* [ ] is licensed under MIT.
* [ ] has the correct project structure.
* [ ] has a dev and master branch, and dev should default branch.
* [ ] is using DSC Resource Kit test templates.
* [ ] is connected to Codecov or similar.
* [ ] has established a code of conduct in ether a CODE_OF_CONDUCT.md or a
      'Code of conduct' section in the README.md.
* [ ] has either a CONTRIBUTING.md file or a 'Contributing' section in the
      README.md file.
* [ ] has included the metadata tag 'DSCResource' in the module manifest.
* [ ] is sufficiently [documented](https://github.com/PowerShell/DscResources/blob/master/CONTRIBUTING.md#writing-documentation).
* [ ] has an established [CI process](https://github.com/PowerShell/DscResources/blob/master/CONTRIBUTING.md#tests-in-appveyor) for each push to the repository.
* [ ] is sufficiently [tested](https://github.com/PowerShell/DscResources/blob/master/CONTRIBUTING.md#write-tests).
* [ ] Follows the guidelines set out for a
      [High Quality Resource Module](https://github.com/PowerShell/DscResources/blob/master/Naming.md#high-quality-resource-module).

### Submission acceptance

The community accepts, at a community call, that a resource module follows the
guidelines set out for a
[High Quality Resource Module](https://github.com/PowerShell/DscResources/blob/master/Naming.md#high-quality-resource-module).

* [ ] The resource module was accepted for submission in a community call.
