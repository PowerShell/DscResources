# Test Template Change List

Any changes made to the *Tests.Template* files must be added to the appropriate
section in this document.
The version number in the *Tests.Template* header must also be updated to match.
When the templates are used to create or update tests in a DSC Resource the
version number of the template file used must be included.

## integration_template.config.ps1

### Version 1.2.0

- Allows reading the configuration data from a JSON file,
  e.g. integration_template.config.json for real testing scenarios outside of
  the CI ([issue #89](https://github.com/PowerShell/DscResources/issues/89)).
- Removed `PSDscAllowPlainTextPassword` from the configuration and replaced it
  with `CertificateFile = $env:DscPublicCertificatePath` so the configuration
  can decrypt credentials if needed.

### Version 1.1.0

- Renamed filename of the integration test config template to use the right
  naming convention.
- Change so that 'Configuration' is written with upper 'C'. The name of the
  configuration has 'Config' as suffix, that also has upper 'C' now.
- Added a configuration data hash table to be used with the version 1.3.0 of the
  integration test template.
- Updated comments.

### Version 1.0.1

- Updated resource module name in comments to 'NetworkingDsc' and 'Firewall' to
  be consistent and use a HQRM resource module name as example.

### Version 1.0.0

- First release including version number

## integration_template.ps1

### Version 1.3.0

- Clean up script variables according to style guideline.
- Added a $script:dscResourceFriendlyName variable.
- Wrapped It-blocks into a Context-block to differentiate each test
  configuration.
- Updated TODO comments.
- Added the use of a ConfigurationData block for variables.
- Made it easier to pass additional parameters to a configuration.
- Improved test that evaluates properties returned from
  Get-DscConfiguration ([issue #328](https://github.com/PowerShell/DscResources/issues/328)).
- Added a test that verifies that the correct value is returned from
  Test-DscConfiguration.

### Version 1.2.1

- Updated resource module name in comments to 'NetworkingDsc' and 'Firewall' to
  be consistent and use a HQRM resource module name as example.

### Version 1.2.0

- Update Pester syntax to v4
- Now `-ErrorAction Stop` is used for the cmdlet Start-DscConfiguration so
  that all errors throw an error making the tests fail.

### Version 1.1.2

- Removed backslashes from git clone command to improve compatibility with
  unusual file paths.

### Version 1.1.1

- Convert Invoke-Expression to '&' to improve readability

### Version 1.1.0

- Getting rid of git-dependency

### Version 1.0.0

- First release including version number

## unit_template.ps1

### Version 1.2.3

- When cloning DscResource.Tests, it using the same casing on the repository folder
  ([issue #431](https://github.com/PowerShell/DscResources/issues/431))

### Version 1.2.3

- Update description in comment-based help.
- Added example of placement of mocks (issue #425).

### Version 1.2.2

- Added more Describe-blocks and updated the descriptions.
- Added more Context-blocks and updated the descriptions.
- Added a comment saying to remove any unused BeforeAll-, AfterAll-,
  BeforeEach- and AfterEach-blocks.

### Version 1.2.1

- Removed backslashes from git clone command to improve compatibility
  with unusual file paths.

### Version 1.1.0

- Getting rid of git-dependency

### Version 1.0.0

- First release including version number
