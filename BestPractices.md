# Best Practices
**This document is still in-progress.**

## Table of Contents
- [General](#general)
- [Calling Functions](#calling-functions)
- [Writing Functions](#writing-functions)
- [DSC Resource Functions](#dsc-resource-functions)
- [Manifests](#manifests)

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

**Bad:**
```powershell

```

**Good:**
```powershell

```

### Use PSCredential for All Credentials

**Bad:**
```powershell

```

**Good:**
```powershell

```

### Use Variables Rather Than Extensive Piping

**Bad:**
```powershell

```

**Good:**
```powershell

```

### Avoid Unnecessary Type Declarations

**Bad:**
```powershell
[String] $myString = 'My String'
```

**Good:**
```powershell
$myString = 'My String'
```

## Calling Functions

### Use Named Parameters Instead of Positional Parameters
Call cmdlets using named parameters instead of positional parameters.

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
You can get the full command an alias is using by calling ```Get-Alias```.

**Bad**
```powershell
ls -File $root -Recurse | ? { @('.gitignore', '.mof') -contains $_.Extension }
```

**Good** 
```Powershell
Get-ChildItem -File $root -Recurse | Where-Object { @('.gitignore', '.mof') -contains $_.Extension } 
```

### Avoid Invoke-Expression

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

**Bad:**
```powershell
Get-WMIInstance -ClassName Win32_Process
```

**Good:**
```powershell
Get-CIMInstance -ClassName Win32_Process
```

### Avoid Write-Host

**Bad:**
```powershell
Write-Host 'Setting the variable to a value.'
```

**Good:**
```powershell
Write-Verbose -Message 'Setting the variable to a value.'
```

### Avoid ConvertTo-SecureString

**Bad:**
```powershell

```

**Good:**
```powershell

```

### Assign Function Results to Variables Rather Than Extensive Inline Calls

**Bad:**
```powershell

```

**Good:**
```powershell

```

## Writing Functions

### Avoid Default Values for Mandatory Parameters

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

**Bad:**
```powershell

```

**Good:**
```powershell

```

### Use the CmdletBindining Attribute on Every Function

**Bad:**
```powershell

```

**Good:**
```powershell

```

### Define the OutputType Attribute for All Functions With Output

**Bad:**
```powershell

```

**Good:**
```powershell

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
