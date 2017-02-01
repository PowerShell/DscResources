**Parameters**

| Parameter | Attribute | DataType | Description | Allowed Values |
| --- | --- | --- | --- | --- |
| **Url** | Key | string | The URL of the site collection | |
| **OwnerAlias** | Required | string | The username of the site collection administrator | |
| **CompatibilityLevel** | Write | uint32 | The compatibility level of the site | |
| **ContentDatabase** | Write | string | The name of the content database to create the site in | |
| **Description** | Write | string | The description to apply to the site collection | |
| **HostHeaderWebApplication** | Write | string | The URL of the host header web application to create this site in | |
| **Language** | Write | uint32 | The language code of the site | |
| **Name** | Write | string | The display name of the site collection | |
| **OwnerEmail** | Write | string | The email address of the site collection administrator | |
| **QuotaTemplate** | Write | string | The quota template to apply to the site collection | |
| **SecondaryEmail** | Write | string | The secondary site collection admin email address | |
| **SecondaryOwnerAlias** | Write | string | The secondary site collection admin username | |
| **Template** | Write | string | The template to apply to the site collection | |
| **InstallAccount** | Write | String | POWERSHELL 4 ONLY: The account to run this resource as, use PsDscRunAsAccount if using PowerShell 5 | |

**Description**

This resource will provision a site collection to the current farm, based on 
the settings that are passed through. These settings map to the New-SPSite 
cmdlet and accept the same values and types. 

The current version of SharePointDsc is only able to check for the existence 
of a site collection, the additional parameters are not checked for yet, but 
will be in a later release

**Examples**


***Example 1***

This example creates a site collection with the provided details

````powershell
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
````

