# Best Practices

**This document is still in-progress.**

## Table of Contents

- [General](#general)
  - [Avoid Using Hardcoded Computer Name](#avoid-using-hardcoded-computer-name)
  - [Avoid Empty Catch Blocks](#avoid-empty-catch-blocks)
  - [Ensure Null is on Left Side of Comparisons](#ensure-null-is-on-left-side-of-comparisons)
  - [Avoid Global Variables](#avoid-global-variables)
  - [Use Declared Local and Script Variables More Than Once](#use-declared-local-and-script-variables-more-than-once)
  - [Use PSCredential for All Credentials](#use-pscredential-for-all-credentials)
  - [Use Variables Rather Than Extensive Piping](#use-variables-rather-than-extensive-piping)
  - [Avoid Unnecessary Type Declarations](#avoid-unnecessary-type-declarations)
- [Calling Functions](#calling-functions)
  - [Avoid Cmdlet Aliases](#avoid-cmdlet-aliases)
  - [Avoid Invoke-Expression](#avoid-invoke-expression)
  - [Use the Force Parameter with Calls to ShouldContinue](#use-the-force-parameter-with-calls-to-shouldcontinue)
  - [Avoid the WMI Cmdlets](#avoid-the-wmi-cmdlets)
  - [Avoid Write-Host](#avoid-write-host)
  - [Avoid ConvertTo-SecureString with AsPlainText](#avoid-convertto-securestring-with-asplaintext)
  - [Assign Function Results to Variables Rather Than Extensive Inline Calls](#assign-function-results-to-variables-rather-than-extensive-inline-calls)
- [Writing Functions](#writing-functions)
  - [Avoid Default Values for Mandatory Parameters](#avoid-default-values-for-mandatory-parameters)
  - [Avoid Default Values for Switch Parameters](#avoid-default-values-for-switch-parameters)
  - [Include the Force Parameter in Functions with the ShouldContinue Attribute](#include-the-force-parameter-in-functions-with-the-shouldcontinue-attribute)
  - [Use ShouldProcess if the ShouldProcess Attribute is Defined](#use-shouldprocess-if-the-shouldprocess-attribute-is-defined)
  - [Define the ShouldProcess Attribute if the Function Calls ShouldProcess](#define-the-shouldprocess-attribute-if-the-function-calls-shouldprocess)
  - [Avoid Redefining Reserved Parameters](#avoid-redefining-reserved-parameters)
  - [Use the CmdletBinding Attribute on Every Function](#use-the-cmdletbinding-attribute-on-every-function)
  - [Define the OutputType Attribute for All Functions With Output](#define-the-outputtype-attribute-for-all-functions-with-output)
  - [Return Only One Object From Each Function](#return-only-one-object-from-each-function)
- [DSC Resource Functions](#dsc-resource-functions)
  - [Return a Hashtable from Get-TargetResource](#return-a-hashtable-from-get-targetresource)
  - [Return a Boolean from Test-TargetResource](#return-a-boolean-from-test-targetresource)
  - [Avoid Returning Anything From Set-TargetResource](#avoid-returning-anything-from-set-targetresource)
  - [Define Get-TargetResource, Set-TargetResource, and Test-TargetResource for Every DSC Resource](#define-get-targetresource-set-targetresource-and-test-targetresource-for-every-dsc-resource)
  - [Get-TargetResource should not contain unused non-mandatory parameters](#get-targetresource-should-not-contain-unused-non-mandatory-parameters)
  - [Any unused parameters that must be included in a function definition should include 'Not used in \<function_name\>' in the help comment for that parameter in the comment-based help](#any-unused-parameters-that-must-be-included-in-a-function-definition-should-include-not-used-in-function_name-in-the-help-comment-for-that-parameter-in-the-comment-based-help)
  - [Use Identical Parameters for Set-TargetResource and Test-TargetResource](#use-identical-parameters-for-set-targetresource-and-test-targetresource)
  - [Use Write-Verbose At Least Once in Get-TargetResource, Set-TargetResource, and Test-TargetResource](#use-write-verbose-at-least-once-in-get-targetresource-set-targetresource-and-test-targetresource)
  - [Use *-TargetResource for Exporting DSC Resource Functions](#use--targetresource-for-exporting-dsc-resource-functions)
- [Manifests](#manifests)
  - [Avoid Using Deprecated Manifest Fields](#avoid-using-deprecated-manifest-fields)
  - [Ensure Manifest Contains Correct Fields](#ensure-manifest-contains-correct-fields)
  - [Do not use NestedModules to export shared commands](#do-not-use-nestedmodules-to-export-shared-commands)
- [Localization](#localization)
  - [Localization string ID suffix](#localization-string-id-suffix)
  - [Using localization string in code](#using-localization-string-in-code)
  - [Helper functions for localization](#helper-functions-for-localization)
    - [`Get-LocalizedData`](#get-localizeddata)
    - [`New-InvalidArgumentException`](#new-invalidargumentexception)
    - [`New-InvalidOperationException`](#new-invalidoperationexception)
    - [`New-ObjectNotFoundException`](#new-objectnotfoundexception)
    - [`New-InvalidResultException`](#new-invalidresultexception)
- [Pester Tests](#pester-tests)
  - [Capitalized Pester Assertions](#capitalized-pester-assertions)

## General

### Avoid Using Hardcoded Computer Name

Using hardcoded computer names exposes sensitive information on your machine.
Use a parameter or environment variable instead if a computer name is necessary.
This comes from [this](https://github.com/PowerShell/PSScriptAnalyzer/blob/development/RuleDocumentation/AvoidUsingComputerNameHardcoded.md) PS Script Analyzer rule.

**Bad:**

```powershell
Invoke-Command -Port 0 -ComputerName 'hardcodedName'
```

**Good:**

```powershell
Invoke-Command -Port 0 -ComputerName $env:computerName
```

### Avoid Empty Catch Blocks

Empty catch blocks are not necessary.
Most errors should be thrown or at least acted upon in some way.
If you really don't want an error to be thrown or logged at all, use the ErrorAction parameter with the SilentlyContinue value instead.

**Bad:**

```powershell
try
{
    Get-Command -Name Invoke-NotACommand
}
catch {}
```

**Good:**

```powershell
Get-Command -Name Invoke-NotACommand -ErrorAction SilentlyContinue
```

### Ensure Null is on Left Side of Comparisons

When comparing a value to ```$null```, ```$null``` should be on the left side of the comparison.
This is due to an issue in PowerShell.
If ```$null``` is on the right side of the comparison and the value you are comparing it against happens to be a collection, PowerShell will return true if the collection *contains* ```$null``` rather than if the entire collection actually *is* ```$null```.
Even if you are sure your variable will never be a collection, for consistency, please ensure that ```$null``` is on the left side of all comparisons.

**Bad:**

```powershell
if ($myArray -eq $null)
{
    Remove-AllItems
}
```

**Good:**

```powershell
if ($null -eq $myArray)
{
    Remove-AllItems
}
```

### Avoid Global Variables

Avoid using global variables whenever possible.
These variables can be edited by any other script that ran before your script or is running at the same time as your script.
Use them only with extreme caution, and try to use parameters or script/local variables instead.

This rule has a few exceptions:

- The use of ```$global:DSCMachineStatus``` is still recommended to restart a machine from a DSC resource.

**Bad:**

```powershell
$global:configurationName = 'MyConfigurationName'
...
Set-MyConfiguration -ConfigurationName $global:configurationName
```

**Good:**

```powershell
$script:configurationName = 'MyConfigurationName'
...
Set-MyConfiguration -ConfigurationName $script:configurationName
```

### Use Declared Local and Script Variables More Than Once

Don't declare a local or script variable if you're not going to use it.
This creates excess code that isn't needed

### Use PSCredential for All Credentials

PSCredentials are more secure than using plaintext username and passwords.

**Bad:**

```powershell
function Get-Settings
{
    param
    (
        [String]
        $Username

        [String]
        $Password
    )
    ...
}
```

**Good:**

```powershell
function Get-Settings
{
    param
    (
        [PSCredential]
        [Credential()]
        $UserCredential
    )
}
```

### Use Variables Rather Than Extensive Piping

This is a script not a console. Code should be easy to follow.
There should be no more than 1 pipe in a line.
This rule is specific to the DSC Resource Kit - other PowerShell best practices may say differently, but this is our preferred format for readability.

**Bad:**

```powershell
Get-Objects | Where-Object { $_.Propery -ieq 'Valid' } | Set-ObjectValue `
    -Value 'Invalid' | Foreach-Object { Write-Output $_ }
```

**Good:**

```powershell
$validPropertyObjects = Get-Objects | Where-Object { $_.Property -ieq 'Valid' }

foreach ($validPropertyObject in $validPropertyObjects)
{
    $propertySetResult = Set-ObjectValue $validPropertyObject -Value 'Invalid'
    Write-Output $propertySetResult
}
```

### Avoid Unnecessary Type Declarations

If it is clear what type a variable is then it is not necessary to explicitly declare its type.
Extra type declarations can clutter the code.

**Bad:**

```powershell
[String] $myString = 'My String'
```

**Bad:**

```powershell
[System.Boolean] $myBoolean = $true
```

**Good:**

```powershell
$myString = 'My String'
```

**Good:**

```powershell
$myBoolean = $true
```

## Calling Functions

### Avoid Cmdlet Aliases

When calling a function use the full command not an alias.
You can get the full command an alias represents by calling ```Get-Alias```.

**Bad:**

```powershell
ls -File $root -Recurse | ? { @('.gitignore', '.mof') -contains $_.Extension }
```

**Good:**

```Powershell
Get-ChildItem -File $root -Recurse | Where-Object { @('.gitignore', '.mof') -contains $_.Extension }
```

### Avoid Invoke-Expression

Invoke-Expression is vulnerable to string injection attacks.
It should not be used in any DSC resources.

**Bad:**

```powershell
Invoke-Expression -Command "Test-$DSCResourceName"
```

**Good:**

```powershell
& "Test-$DSCResourceName"
```

### Use the Force Parameter with Calls to ShouldContinue

**Bad:**

```powershell

```

**Good:**

```powershell

```

### Avoid the WMI Cmdlets

The WMI cmdlets can all be replaced by CIM cmdlets.
Use the CIM cmdlets instead because they align with industry standards.

**Bad:**

```powershell
Get-WMIInstance -ClassName Win32_Process
```

**Good:**

```powershell
Get-CIMInstance -ClassName Win32_Process
```

### Avoid Write-Host

[Write-Host is harmful](http://www.jsnover.com/blog/2013/12/07/write-host-considered-harmful/).
Use alternatives such as Writ-Verbose, Write-Output, Write-Debug, etc.

**Bad:**

```powershell
Write-Host 'Setting the variable to a value.'
```

**Good:**

```powershell
Write-Verbose -Message 'Setting the variable to a value.'
```

### Avoid ConvertTo-SecureString with AsPlainText

SecureStrings should be encrypted.
When using ConvertTo-SecureString with the AsPlainText parameter specified the SecureString text is not encrypted and thus not secure
This is allowed in tests/examples when needed, but never in the actual resources.

**Bad:**

```powershell
ConvertTo-SecureString -String 'mySecret' -AsPlainText -Force
```

### Assign Function Results to Variables Rather Than Extensive Inline Calls

**Bad:**

```powershell
Set-Background -Color (Get-Color -Name ((Get-Settings -User (Get-CurrentUser)).ColorName))
```

**Good:**

```powershell
$currentUser = Get-CurrentUser
$userSettings = Get-Settings -User $currentUser
$backgroundColor = Get-Color -Name $userSettings.ColorName

Set-Background -Color $backgroundColor
```

## Writing Functions

### Avoid Default Values for Mandatory Parameters

Default values for mandatory parameters will always be overwritten, thus they are never used and can cause confusion.

**Bad:**

```powershell
function Get-Something
{
    param
    (
        [Parameter(Mandatory = $true)]
        [String]
        $Name = 'My Name'
    )

    ...
}
```

**Good:**

```powershell
function Get-Something
{
    param
    (
        [Parameter(Mandatory = $true)]
        [String]
        $Name
    )

    ...
}
```

### Avoid Default Values for Switch Parameters

Switch parameters have 2 values - there or not there.
The default value is automatically $false so it doesn't need to be declared.
If you are tempted to set the default value to $true - don't - refactor your code instead.

**Bad:**

```powershell
function Get-Something
{
    param
    (
        [Switch]
        $MySwitch = $true
    )

    ...
}
```

**Good:**

```powershell
function Get-Something
{
    param
    (
        [Switch]
        $MySwitch
    )

    ...
}
```

### Include the Force Parameter in Functions with the ShouldContinue Attribute

**Bad:**

```powershell

```

**Good:**

```powershell

```

### Use ShouldProcess if the ShouldProcess Attribute is Defined

**Bad:**

```powershell

```

**Good:**

```powershell

```

### Define the ShouldProcess Attribute if the Function Calls ShouldProcess

**Bad:**

```powershell

```

**Good:**

```powershell

```

### Avoid Redefining Reserved Parameters

[Reserved Parameters](https://msdn.microsoft.com/en-us/library/dd901844(v=vs.85).aspx ) such as Verbose, Debug, etc. are already added to the function at runtime so don't redefine them.
Add the CmdletBinding attribute to include the reserved parameters in your function.

### Use the CmdletBinding Attribute on Every Function

The CmdletBinding attribute adds the reserved parameters to your function which is always preferable.

**Bad:**

```powershell
function Get-Property
{
    param
    (
        ...
    )
    ...
}
```

**Good:**

```powershell
function Get-Property
{
    [CmdletBinding()]
    param
    (
        ...
    )
    ...
}
```

### Define the OutputType Attribute for All Functions With Output

The OutputType attribute should be declared if the function has output so that the correct error messages get displayed if the function ever produces an incorrect output type.

**Bad:**

```powershell
function Get-MyBoolean
{
    [OutputType([Boolean])]
    param ()

    ...

    return $myBoolean
}
```

**Good:**

```powershell
function Get-MyBoolean
{
    [CmdletBinding()]
    [OutputType([Boolean])]
    param ()

    ...

    return $myBoolean
}
```

### Return Only One Object From Each Function

**Bad:**

```powershell

```

**Good:**

```powershell

```

## DSC Resource Functions

### Return a Hashtable from Get-TargetResource

**Bad:**

```powershell

```

**Good:**

```powershell

```

### Return a Boolean from Test-TargetResource

**Bad:**

```powershell

```

**Good:**

```powershell

```

### Avoid Returning Anything From Set-TargetResource

**Bad:**

```powershell

```

**Good:**

```powershell

```

### Define Get-TargetResource, Set-TargetResource, and Test-TargetResource for Every DSC Resource

**Bad:**

```powershell

```

**Good:**

```powershell

```

### Get-TargetResource should not contain unused non-mandatory parameters

The inclusion of a non-mandatory parameter that is never used could signal that there is a design flaw in the implementation of the `Get-TargetResource` function.
The non-mandatory parameters that are used to call `Get-TargetResource` should help to retrieve the actual values of the properties for the resource.
For example, if there is a parameter `Ensure` that is non-mandatory, that parameter describes the state the resource should have, but it might not be used to retrieve
the actual values.
Another example would be if a parameter `FilePathName` is set to be non-mandatory, but `FilePathName` is actually a property that `Get-TargetResource` should return
the actual value of.
In that case it does not make sense to assign a value to `FilePathName` when calling `Get-TargetResource` because that value will never be used.

**Bad:**

```powershell
<#
    .SYNOPSIS
        Returns the current state of the feature.

    .PARAMETER Name
        The feature for which to return the state for.

    .PARAMETER ServerName
        The server name on which the feature is installed.

    .PARAMETER Ensure
        The desired state of the feature.
#>
function Get-TargetResource
{
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter(Mandatory = $true)]
        [System.String]
        $ServerName,

        [Parameter()]
        [System.String]
        $Ensure
    )

    Write-Verbose -Message ('{0} for {1}' -f $Name, $ServerName)

    if( $Name )
    {
        $feature = 'Enabled'
    }

    return @{
        Name = $Name
        Servername = $ServerName
        Feeature = $feature
    }
}
```

**Good:**

```powershell
<#
    .SYNOPSIS
        Returns the current state of the feature.

    .PARAMETER Name
        The feature for which to return the state for.

    .PARAMETER ServerName
        The server name on which the feature is installed.
#>
function Get-TargetResource
{
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter(Mandatory = $true)]
        [System.String]
        $ServerName
    )

    Write-Verbose -Message ('{0} for {1}' -f $Name, $ServerName)

    if( $Name )
    {
        $feature = 'Yes'
    }

    return @{
        Name = $Name
        Servername = $ServerName
        Feeature = $feature
    }
}
```

### Any unused parameters that must be included in a function definition should include 'Not used in \<function_name\>' in the help comment for that parameter in the comment-based help

The inclusion of a mandatory parameter in the 'Get-TargetResource' function that is never used could signal that there is a design flaw in the implementation
of the function.
The mandatory parameters that are used to call 'Get-TargetResource' should help to retrieve the actual values of the properties for the resource.
For example, if there is a parameter 'Ensure' that is mandatory, that parameter will not be used to retrieve the actual values.
Another example would be if a parameter 'FilePathName' is set to be mandatory, but 'FilePathName' is actually a property that 'Get-TargetResource' should
return the actual value of. In that case it does not make sense to assign a value to 'FilePathName' when calling 'Get-TargetResource' because that value will
never be used.

The inclusion of a mandatory or a non-mandatory parameter in the Test-TargetResource function that is not used is more common since it is required that both
the 'Set-TargetResource' and the 'Test-TargetResource' have the same parameters. Thus, there will be times when not all of the parameters in the 'Test-TargetResource'
function will be used in the function.

If there is a need design-wise to include a mandatory parameter that will not be used, then the comment-based help for that parameter should contain the description 'Not used in <function_name>'.

**Bad:**

```powershell
<#
    .SYNOPSIS
        Returns the current state of the feature.

    .PARAMETER Name
        The feature for which to return the state for.

    .PARAMETER ServerName
        The server name on which the feature is installed.

    .PARAMETER Ensure
        The desired state of the feature.
#>
function Get-TargetResource
{
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter(Mandatory = $true)]
        [System.String]
        $ServerName,

        [Parameter(Mandatory = $true)]
        [System.String]
        $Ensure
    )

    Write-Verbose -Message ('{0} for {1}' -f $Name, $ServerName)

    if( $Name )
    {
        $feature = 'Yes'
    }

    return @{
        Name = $Name
        Servername = $ServerName
        Feeature = $feature
    }
}
```

**Good:**

```powershell
<#
    .SYNOPSIS
        Returns the current state of the feature.

    .PARAMETER Name
        The feature for which to return the state for.

    .PARAMETER ServerName
        The server name on which the feature is installed.

    .PARAMETER Ensure
        The desired state of the feature.
        Not used in Get-TargetResource
#>
function Get-TargetResource
{
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter(Mandatory = $true)]
        [System.String]
        $ServerName,

        [Parameter(Mandatory = $true)]
        [System.String]
        $Ensure
    )

    Write-Verbose -Message ('{0} for {1}' -f $Name, $ServerName)

    if( $Name )
    {
        $feature = 'Yes'
    }

    return @{
        Name = $Name
        Servername = $ServerName
        Feeature = $feature
    }
}
```

### Use Identical Parameters for Set-TargetResource and Test-TargetResource

**Bad:**

```powershell

```

**Good:**

```powershell

```

### Use Write-Verbose At Least Once in Get-TargetResource, Set-TargetResource, and Test-TargetResource

**Bad:**

```powershell

```

**Good:**

```powershell

```

### Use *-TargetResource for Exporting DSC Resource Functions

**Bad:**

```powershell

```

**Good:**

```powershell

```

## Manifests

### Avoid Using Deprecated Manifest Fields

**Bad:**

```powershell

```

**Good:**

```powershell

```

### Ensure Manifest Contains Correct Fields

**Bad:**

```powershell

```

**Good:**

```powershell

```

### Do not use NestedModules to export shared commands

Since we don't use the `RootModule` key in the module manifest, we should not
use the `NestedModules` key to add modules that export commands that are shared
between resource modules.

Normally, a single list in the `RootModule` key, can restrict what is
exported using the cmdlet `Export-ModuleMember`. Since we don't use the `RootModule`
key we can't restrict what is exported, so every nested module will export all the
commands (or all the commands restricted by `Export-ModuleMember` in that
individual nested module). If two resource modules were to use the `NestedModules`
method, it would result in one of them being unable to install since they have
conflicting exported commands.

## Localization

In each resource folder there should be at least one localization folder for
english language 'en-US'. Add other localization folders as appropriate, the
correct folder name can be found by running `Get-UICulture` on the node that
has a UI culture installed that the strings are being built for.
There is also the list of
[Available Language Packs for Windows](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/available-language-packs-for-windows#language-packs).

In each localization folder there should be a PowerShell data (.psd1) file named
'MSFT_\<ResourceName\>.strings.psd1' (e.g. 'MSFT_Folder.strings.psd1').
Each localized string file should contain the following with the correct
localization key and accompanying localization string value (the example uses
the friendly resource name of 'Folder').

```powershell
# Localized resources for Folder

ConvertFrom-StringData @'
    CreateFolder = Creating folder at path '{0}'. (F0001)
    RetrievingFolderInformation = Retrieving folder information from path '{0}'. (F0002)
    ProblemAccessFolder = Could not access the requested path '{0}'. (F0003)
    FailedToReadProperties = Could not read property '{0}' of path '{1}'. (F0004)
'@
```

When using the previous example, the folder structure would look like the
following:

```plaintext
DSCResources\MSFT_Folder\en-US\MSFT_Folder.strings.psd1
DSCResources\MSFT_Folder\es-ES\MSFT_Folder.strings.psd1
```

To use the localization strings in a resource, then localization strings are
imported at the top of each resource PowerShell module script file (.psm1). The
localized strings should be imported using [`Get-LocalizedData`](#get-localizeddata).

### Localization string ID suffix

To easier debug localized verbose logs, and to find the correct localized string
key in the code, it is recommended to use a hard coded ID on each localized key's
string value. That ID must be the same across the localized language files,
and it is not recommended to reuse ID's once they become obsolete (because of
for example code change).

> Using this method we could also test that each localized string is
> represented in each language specific localization file for that
> resource.

**Format:** `(ID:yyyyZZZZ)`

- 'yyyy' - The resource name prefix. It is composed of every first letter of
   every word in the resource friendly name.
- 'ZZZZ' - The suffix is a serial number starting from '0001'.

**Example of prefixes:**

Module | Resource | ID prefix (yyyy) | First string ID suffix
--- | --- | --- | ---
PSDscResources | GroupResource | GR | `(GR0001)`
PSDscResources | WindowsOptionalFeature | WOF | `(WOF0001)`
SqlServerDsc | SqlSetup | SS | `(SS0001)`
SqlServerDsc | SqlAGDatabase| SAGD | `(SAGD0001)`
NetworkingDsc | DnsClientGlobalSetting | DCGS | `(DCGS0001)`
NetworkingDsc | Firewall | F | `(F0001)`
CertificateDsc | PfxImport | PI | `(PI0001)`
CertificateDsc | WaitForCertificateServices | WFCS | `(WFCS0001)`

**Example of usage:**

See example of localized strings under [Localization](#localization).

### Using localization string in code

This is an example of how to write localized verbose messages.

```powershell
Write-Verbose -Message `
    ($script:localizedData.RetrievingFolderInformation -f $path)
```

This is an example of how to write localized warning messages.

```powershell
Write-Warning -Message `
    ($script:localizedData.ProblemAccessFolder -f $path)
```

This is an example of how to throw localized error messages, but the
[helper functions](#helper-functions-for-localization)
[`New-InvalidArgumentException`](#new-invalidargumentexception),
[`New-InvalidOperationException`](#new-invalidoperationexception),
[`New-ObjectNotFoundException`](#new-objectnotfoundexception) and
[`New-InvalidResultException`](#new-invalidresultexception)
should preferably be used whenever possible.

```powershell
throw ($script:localizedData.FailedToReadProperties -f $property, $path)
```

#### Helper functions for localization

There are also five helper functions to simplify localization. These can be
currently only be found in other resource modules, for example in the resource
module SqlServerDsc, in the [CommonResourceHelper](https://github.com/PowerShell/SqlServerDsc/blob/dev/DSCResources/CommonResourceHelper.psm1)
module. To use it, copy the PowerShell module
[CommonResourceHelper.psm1](https://github.com/PowerShell/SqlServerDsc/blob/dev/DSCResources/CommonResourceHelper.psm1)
and the unit tests
[CommonResourceHelper.Tests.ps1](https://github.com/PowerShell/SqlServerDsc/blob/dev/Tests/Unit/CommonResourceHelper.Tests.ps1)
to the new resource module.

> **Note:** The CommonResourceHelper module will be moved to DscResource.Template
> in the future.

##### Get-LocalizedData

This should be used at the top of each resource PowerShell module script file
(.psm1).
Refer to the comment-based help for more information about this helper function.

```powershell
Import-Module -Name (Join-Path -Path (Split-Path -Path $PSScriptRoot -Parent) `
                               -ChildPath 'CommonResourceHelper.psm1')

$script:localizedData = Get-LocalizedData -ResourceName 'MSFT_SqlSetup'
```

##### New-InvalidArgumentException

Refer to the comment-based help for more information about this helper function.

```powershell
if ( -not $resultOfEvaluation )
{
    $errorMessage = `
        $script:localizedData.ActionCannotBeUsedInThisContextMessage `
            -f $Action, $Parameter

    New-InvalidArgumentException -ArgumentName 'Action' -Message $errorMessage
}
```

##### New-InvalidOperationException

Refer to the comment-based help for more information about this helper function.

```powershell
try
{
    Start-Process @startProcessArguments
}
catch
{
    $errorMessage = $script:localizedData.InstallationFailedMessage -f $Path, $processId
    New-InvalidOperationException -Message $errorMessage -ErrorRecord $_
}

```

##### New-ObjectNotFoundException

Refer to the comment-based help for more information about this helper function.

```powershell
try
{
    Get-ChildItem -Path $path
}
catch
{
    $errorMessage = $script:localizedData.PathNotFoundMessage -f $path
    New-ObjectNotFoundException -Message $errorMessage -ErrorRecord $_
}

```

##### New-InvalidResultException

Refer to the comment-based help for more information about this helper function.

```powershell
try
{
    $numberOfObjects = Get-ChildItem -Path $path
    if ($numberOfObjects -eq 0)
    {
        throw 'To few files.'
    }
}
catch
{
    $errorMessage = $script:localizedData.TooFewFilesMessage -f $path
    New-InvalidResultException -Message $errorMessage -ErrorRecord $_
}

```

## Pester Tests

### Capitalized Pester Assertions

Pester assertions should all start with capital letters.  This makes code easier to read.

**Bad:**

```powershell
it 'Should return something' {
    get-targetresource @testParameters | should -be 'something'
}
```

**Good:**

```powershell
It 'Should return something' {
    Get-TargetResource @testParameters | Should -Be 'something'
}
```
