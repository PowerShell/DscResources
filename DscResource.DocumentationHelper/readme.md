# DSCResource.DocumentationHelper

This module is designed to assist in the generation of consistent documentation for all DSC
resources. The module is currently capable of generating the following types of documentation:

 * PowerShell help files
 * GitHub wiki Markdown pages

The module does this by analysing a number of components within the module itself to 
automatically generate the outputs. This means less time can be spent manually keeping
documentation up to date and the required components for the documentation can be reviewed
more easily as the pull requests with changes come through.

*Note: Currently this module only supports generating documentation for MOF based DSC 
resources. There is no support for class based resources*

## Preparing for generating documentation

To prepare the most effective documentation possible, there are a few things that can be
added to a module that the documentation helper will look to include:

### Details in the MOF Schema

Inside the .schema.mof file for a specific resource the script will look for the following
elements automatically:

 * Property names and data types
 * Property schema types (Key, Required, Read, Write)
 * Property descriptions
 * Allowed values from the Values property

### A readme.md file in the resources folder

If you place a 'readme.md' file in the folder for each individual resource (alongside the
.psm1 and .schema.mof files) this will be treated as the text description of the resource.
It should include a emphasised called "description" like this:

    **Description**

After that any text afterwards will be the description for that resource. 

*Note: Currently other markdown syntax is not processed, it is treated as raw text. So do
not include emphasis, links or other formatting in this file at this time*

### Examples 

To include examples in your documentation, create a folder called "Examples" in the root 
folder for your resource module, and add a folder called "Resources" within that (by using 
this sub-folder we can still include other examples that do not related to a specific
resource in the examples folder, and all the resoruce specific examples go in the 'resoruces'
folder). In this folder create a new sub-folder for each DSC resource you wish to include
examples for, naming it with the friendly name of the resource (for example, the examples
for SPSite from SharePointDsc would go in \Examples\Resources\SPSite not 
\Examples\Resources\MSFT_SPSite). The examples should always be a complete and valid 
configuration that shows the individual resources use. An example of this:

    <#
    .EXAMPLE
        This example creates a site collection with the provided details
    #>

        Configuration Example 
        {
            param(
                [Parameter(Mandatory = $true)]
                [PSCredential]
                $SetupAccount
            )
            Import-DscResource -ModuleName SharePointDsc

            node localhost {
                SPSite TeamSite
                {
                    Url                      = "http://sharepoint.contoso.com"
                    OwnerAlias               = "CONTOSO\ExampleUser"
                    HostHeaderWebApplication = "http://spsites.contoso.com"
                    Name                     = "Team Sites"
                    Template                 = "STS#0"
                    PsDscRunAsCredential     = $SetupAccount
                }
            }
        }
 
Here the comment based help of "Example" is used as a text friendly description of the
example that will be used in the documentation that is generated, so use this comment
section to describe the example. You can also see that a valid credential parameter is 
used here also. This means that this ps1 file can be checked for compiler errors to ensure
that it is a valid use of the resource, which can and should be integrated in to the 
unit tests for each module, to ensure that examples are always up to date.

To include multiple examples for a single resource, just add multiple PS1 files to the 
folder for that resource. To ensure they appear in a specific order in the documentation
it is recommended that the files be named with numbers at the front of the file names, so
1-ThisExample.ps1, 2-ThatExample.ps1, 3-AnotherExample.ps1. The actual names of the files
are never shown in the output documentation, they are just used to sort the examples in to
order.

## Generating PowerShell help files

To generate PowerShell help files execute the following script

    # Replace this path with the path to where this module is saved
    Import-Module C:\repos\DscResources\DscResource.DocumentationHelper
    Write-DscResourcePowerShellHelp -ModulePath C:\repos\SharePointdsc -OutputPath C:\repos\SharePointDsc\en-US

This will save the PowerShell help files in the en-US directory

## Generating Wiki pages 

To generate wiki pages execute the following script

    # Replace this path with the path to where this module is saved
    Import-Module C:\repos\DscResources\DscResource.DocumentationHelper
    Write-DscResourceWikiSite -ModulePath C:\repos\SharePointdsc -OutputPath C:\output\wiki

This will save the PowerShell help files in the output folder specified

## Examples

Below are examples of the documentation that is generated

 * [PowerShell Help](PowerShellExample.txt)
 * [Wiki Page](WikiExample.md)
