# TEMPLATE README

This is a template that can be used as a baseline for starting your own
repository containing a DSC resource module.

## Using the template

The template is used by copy all the folder and files under the folder
[DscResource.Template](https://github.com/PowerShell/DscResources/tree/master/DscResource.Template)
to the root of your new repository.
After that you need to go through each file, update the information and code.

Some services should be connected to the new repository, see
[Adding services to your repository](#adding-services-to-your-repository).

A suggestion is to add a LICENSE and a CONTRIBUTING.md file to your repository.
You should have been asked to add a license if you created the repository on
GitHub (but can also be added after).

### Folder structure

```plaintext
.
│   .codecov.yml
│   .gitattributes
│   .gitignore
│   .MetaTestOptIn.json
│   appveyor.yml
│   CHANGELOG.md
│   README.md
│   ResourceModule.psd1
│
├───.vscode
│       analyzersettings.psd1
│       settings.json
│
├───DSCResources
│   └───MSFT_ResourceName
│       │   MSFT_ResourceName.psm1
│       │   MSFT_ResourceName.schema.mof
│       │
│       └───en-US
│               MSFT_ResourceName.strings.psd1
│
├───Examples
│   └───Resources
│       └───ResourceName
│               1-VeryShortDescription.ps1
│
├───Modules
│   └───ModuleName.Common
│       │   ModuleName.Common.psm1
│       │
│       └───en-US
│               ModuleName.Common.strings.psd1
│
└───Tests
    ├───Integration
    │       MSFT_ResourceName.config.ps1
    │       MSFT_ResourceName.Integration.Tests.ps1
    │
    └───Unit
            MSFT_ResourceName.Tests.ps1
```

#### .codecov.yml

This is the settings file for the Codecov service. This contains the settings
for the DSC Resource Kit.
No changes is needed for this file.

#### .gitattributes

This is the settings file for git. This file is used by DSC Resource Kit to
always check out the files with CRLF regardless how git is configured.
It must be present for the automatic publishing of examples to PowerShell Gallery
to work (opt-in in the test framework, DscResource.Tests).
No changes is needed for this file.

#### .gitignore

This file is used by git to ignore certain files or folder so they does not get
committed to the repository. This file is used by the DSC Resource Kit to ignore
the folder DscResource.Tests which is automatically cloned by the unit and
integration tests when using the unit and integration test templates.
No changes is needed for this file.

#### .MetaTestOptIn.json

This files controls what tests are opt-in when the test framework is run, in for
example AppVeyor.
If some test is opt-out, then the test framework will output the strings to put
into this file. Add those strings to this file to opt-in for those tests.
No changes is needed for this file, unless opt-in for more tests.

#### appveyor.yml

This is the control file for AppVeyor (that runs the CI pipeline). This file
tells AppVeyor how and what to run.
If using the automatic publishing of examples, then the API key need to be
updated, otherwise the environment variable can be removed.
No other changes is needed for this file.

#### CHANGELOG.md

This file is meant to used to track changes in the resource module. Update
{ModuleName} to match the name of the resource module, and update the sections
to suit your needs.

#### README.md

This file is meant to used to show information about the repository and the
documentation around the resources in the resource module.

Update:

- {ModuleName} throughout to match the name of the resource module.
- { Description of the module ... } to match the description of your module.
- Change the section about the code of conduct to one that you want you and your
  contributors to follow.
- {token} to your token for AppVeyor.
- Update the section "How to contribute". Can also point to your contributing
  guidelines in a CONTRIBUTING.md.
- Under the section Resources to match your resources.

#### ResourceModule.psd1

Rename this file, replacing 'ResourceModule', with the name of your resource
module.
Replace the content of the properties in this file to match your resource module.
Important is to change the GUID in this file to a new unique GUID for your
resource module (i.e by running `New-Guid` to get a unique GUID).

#### .vscode

This folder contains settings file for Visual Studio Code. The settings file
is used to simplify formatting and making sue the correct PS Script Analyzer
rules are used.
If Visual Studio Code is not used as the editor, then this folder is not
necessary. No changes is needed for the files in this folder.

#### DSCResources

This folder contain the actual resource in this resource module.

#### Modules

This folder is meant to contain PowerShell modules that holds helper functions
used by more than one resource. Using this folder for helper function make sure
the test framework finds the module files and shows coverage for the code.

#### Examples

This folder contain the examples of using the resources. These example can
be published automatically to PowerShell Gallery (if opt-in).

#### Tests

This folder holds unit tests and integration tests used to test the resources
and helper function in this resource module.

##### Integration

This folder should contain the integration tests. An integration test is a test
that make actual changes to the environment to test the functionality.

By separating integration tests from the unit tests, the unit test can be run
without the need to be afraid that a test could potentially make destructive
changes to the environment.

##### Unit

This folder should contain the unit tests. A unit test is a test
that _does not_ make changes to the environment. Instead a unit test mock
the command that would make the actual change, making it possible to test
functionality in several code paths.
Unit tests should be safe to run on any environment.

By separating integration tests from the unit tests, the unit test can be run
without the need to be afraid that a test could potentially make destructive
changes to the environment.

## Adding services to your repository

The template assume som free services (for open source projects on GitHub) are
used. You should connect to the services to get the most out of the test framework.

- **AppVeyor** - to run automated tests
- **Codecov** - to get code coverage on PR's and project.
- **PowerShell Gallery** - to publish examples automatically.

## Plaster

There is also a community project to create a Plaster template for generating
a baseline for a DSC resource module. Please see the GitHub repository
[NewDscHighQualityResourceModule](https://github.com/bgelens/NewDscHighQualityResourceModule)
for more information.
