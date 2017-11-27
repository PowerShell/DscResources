# Test Template Change List
Any changes made to the *Tests.Template* files must be added to the appropriate section in this document.
The version number in the *Tests.Template* header must also be updated to match.
When the templates are used to create or update tests in a DSC Resource the version number of the template file used must be included.

## integration_config_template.ps1
### Version 1.0.0
* First release including version number

## integration_template.ps1

### Version 1.2.0
* Update Pester syntax to v4
* Now `-ErrorAction Stop` is used for the cmdlet Start-DscConfiguration so
  that all errors throw an error making the tests fail.

### Version 1.1.2
* Removed backslashes from git clone command to improve compatibility with unusual file paths.

### Version 1.1.1
* Convert Invoke-Expression to '&' to improve readability

### Version 1.1.0
* Getting rid of git-dependency

### Version 1.0.0
* First release including version number

## unit_template.ps1

### Version 1.2.1
* Removed backslashes from git clone command to improve compatibility with unusual file paths.

### Version 1.1.0
* Getting rid of git-dependency

### Version 1.0.0
* First release including version number
