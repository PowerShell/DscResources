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
  - [Use Named Parameters Instead of Positional Parameters](#use-named-parameters-instead-of-positional-parameters)
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

## General

### Avoid Using Hardcoded Computer Name

Using hardcoded computer names exposes sentitive information on your machine.
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
These variables can be editted by any other script that ran before your script or is running at the same time as your script.
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
    Writ-Output $propertySetResult
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

### Use Named Parameters Instead of Positional Parameters

Call cmdlets using named parameters instead of positional parameters.
Named parameters help other developers who are unfamiliar with your code to better understand your code.

**Bad:**

```powershell
Get-ChildItem C:\Documents *.md
```

**Good:**

```powershell
Get-ChildItem -Path C:\Documents -Filter *.md
```

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
For example, if there is a parameter `Ensure` that is non-mandatory, that parameter describes the state the resource should have, but it might not be used to retrive
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
For example, if there is a parameter 'Ensure' that is mandatory, that parameter will not be used to retrive the actual values.
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
