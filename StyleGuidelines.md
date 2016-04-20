# DSC Resource Style Guidelines

In order to provide clean and consistent code, please follow the coding conventions listed below when contributing to this repository and all [DSC Resource Kit repositories](https://github.com/PowerShell/DscResources/tree/master/xDscResources).

For general PowerShell best practices, please refer to [PowerShell Best Practices](https://github.com/PowerShell/PSScriptAnalyzer/blob/development/PowerShellBestPractices.md) document.

General Rules
----------------

 1. For all indentation, use 4 spaces instead of tab stops
 2. Make sure all files are encoding using UTF-8.
 3. Windows handles [newlines](http://en.wikipedia.org/wiki/Newline) using CR+LF instead of just CR.
For interoperability reasons, we recommend that you follow [these instructions](GettingStartedWithGitHub.md#setup-git) when installing Git on Windows so that newlines saved to GitHub are simply CRs.
 4. When writing Markdown, if a paragraph includes more than one sentence, end each sentence with a newline.
GitHub will still render the sentences as a single paragraph, but the readability of `git diff` will be greatly improved.
 5. Files must end with a newline, see [StackOverflow.](http://stackoverflow.com/questions/5813311/no-newline-at-end-of-file) 

PowerShell Coding Style Guidelines
==================================

Code should not contain multiple blank lines in a row
---------------------------------------------------

**Bad:**
```powershell
Function Get-MyValue
{
    Write-Verbose 'Getting MyValue'


    return $MyValue
}
```

The above code breaks this rule by having two new lines between the write-verbose and the return.

**Good:**
```powershell
Function Get-MyValue
{
    Write-Verbose 'Getting MyValue'
    return $MyValue
}
```

Opening curly brackets should not be followed by a blank line
-------------------------------------------------------------

**Bad:**
```powershell
Function Get-MyValue
{

    Write-Verbose 'Getting MyValue'

    return $MyValue
}
```

The code above breaks this rule by leaving a blank line after the opening curly brackets.

**Good:**
```powershell
Function Get-MyValue
{
    Write-Verbose 'Getting MyValue'
    return $MyValue
}
```

Braces should always be on a following line
-------------------------------------------------------------

**Bad:**
```powershell
if ($connected) {
    Write-Verbose 'Connected to server'
}
```

**Good:**
```powershell
if ($connected)
{
    Write-Verbose 'Connected to server'
}
```

Each line should have less than 100 characters
-------------------------------------------------------------

**Bad:**
```powershell
$convertToCimUnjoinCredential = New-CimInstance -ClassName MSFT_Credential -Property @{Username=[string]$UnjoinCredential.UserName; Password=[string]$null} -Namespace root/microsoft/windows/desiredstateconfiguration -ClientOnly
```

**Good:**
```powershell
$convertToCimUnjoinCredential = New-CimInstance -ClassName MSFT_Credential `
        -Property @{Username=[string]$UnjoinCredential.UserName; Password=[string]$null} `
        -Namespace root/microsoft/windows/desiredstateconfiguration -ClientOnly
```

Use verbose, easy to understand names
-------------------------------------------------------------

**Bad:**
```powershell
$rdsHost = Get-RdsHost
```

**Good:**
```powershell
$remoteDesktopSessionHost = Get-RemoteDesktopSessionHost
```

Function names should use PascalCase and follow Noun-Verb convention if possible
-------------------------------------------------------------

**Bad:**
```powershell
function getTargetResource
{
    # ...
}
```

**Good:**
```powershell
function Get-TargetResource
{
    # ...
}
```

Parameter names should use PascalCase 
-------------------------------------------------------------

**Bad:**
```powershell
function Get-TargetResource
{
    [CmdletBinding()]
    param
    (
        $SOURCEPATH
    )
}
```

**Good:**
```powershell
function Get-TargetResource
{
    [CmdletBinding()]
    param
    (
        $SourcePath
    )
}
```

Parameter type should be on the same line as parameter name
-------------------------------------------------------------

**Bad:**
```powershell
function Get-TargetResource
{
    [CmdletBinding()]
    param
    (
        [String]
        $SourcePath = 'c:\'
}
```

**Good:**
```powershell
function Get-TargetResource
{
    [CmdletBinding()]
    param
    (
        [String] $SourcePath = 'c:\'
    )
}
```

Parameter type should be separated from name by a space
-------------------------------------------------------------

**Bad:**
```powershell
function Get-TargetResource
{
    [CmdletBinding()]
    param
    (
        [String]$SourcePath = 'c:\'
    )
}
```

**Good:**
```powershell
function Get-TargetResource
{
    [CmdletBinding()]
    param
    (
        [String] $SourcePath = 'c:\'
    )
}
```

Parameter names should be separated by a single line
-------------------------------------------------------------

**Bad:**
```powershell
function New-EtwEvent
{
    param
    (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [String] $message,
        [ValidateSet("operational", "debug", "analytic")]
        [String] $channel = "operational"
    )
}
```

**Good:**
```powershell
function New-EtwEvent
{
    param
    (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [String] $message,

        [ValidateSet("operational", "debug", "analytic")]
        [String] $channel = "operational"
    )
}
```

Parameter attributes should be on separate lines
-------------------------------------------------------------

**Bad:**
```powershell
function New-EtwEvent
{
    param
    (
        [Parameter(Mandatory=$true)][ValidateNotNullOrEmpty()][String] $message,

        [ValidateSet("operational", "debug", "analytic")][String] $channel = "operational"
    )
}
```

**Good:**
```powershell
function New-EtwEvent
{
    param
    (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [String] $message,

        [ValidateSet("operational", "debug", "analytic")]
        [String] $channel = "operational"
    )
}
```

Variable names should use camelCase
-------------------------------------------------------------

Names of variables should use camelCase

**Bad:**
```powershell
function New-Log
{
    $Message = "New log message" # should start with lower case
    Write-Host $Message
}
```

**Good:**
```powershell
function New-Log
{
    $message = "New log message"
    Write-Host $message
}
```

Support comment-based help
-------------------------------------------------------------

When commenting functions, use comment-based help syntax

**Bad:**
```powershell
# Writes event
function New-EtwEvent
{
    param
    (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [String] $message,

        [ValidateSet("operational", "debug", "analytic")]
        [String] $channel = "operational"
    )
    # Implementation
}
```

**Good:**
```powershell
<#
    .SYNOPSIS Writes event to ETW
    .PARAM
        message Message to write to ETW
    .PARAM
        channel ETW channel where message should be stored
    .EXAMPLE
        New-EtwEvent -message "Attempting to connect to server" -channel "debug"
#>
function New-EtwEvent
{
    param
    (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [String] $message,

        [ValidateSet("operational", "debug", "analytic")]
        [String] $channel = "operational"
    )
    # Implementation
}
```

Call cmdlets using all named parameters instead of positional parameters
------------------------------------------------------------------------

**Bad:**
```powershell
Get-Childitem c:\documents *.md
```

The above code breaks this rule using by calling ```Get-ChildItem``` passing positional parameters instead of named parameters.

**Good:**
```powershell
Get-ChildItem -Path c:\documents -filer *.md
```

Hashtable, Array and Object Structure should be consistent
------------------------------------------------------------------------

**Bad:**
```powershell
$Parameters = @(
    @{ Name = 'Name'; Source = '$FirewallRule.Name'; 
        Type = 'String' },
    @{ Name = 'DisplayName'; Source = '$FirewallRule.DisplayName'; Type = 'String' },
    @{
        Name = 'Group'
        Source = '$FirewallRule.Group'
        Type = 'String'
    },
    @{ Name = 'DisplayGroup'; Source = '$FirewallRule.DisplayGroup'; Type = '' }
)
```

The above array of hashtable objects is not consistent.
*Care must be taken that all each hashtable or object does not exceed the 100 character maximum line width rule.*

**Good:**
```powershell
$Parameters = @(
    @{ Name = 'Name';         Source = '$FirewallRule.Name';         Type = 'String' },
    @{ Name = 'DisplayName';  Source = '$FirewallRule.DisplayName';  Type = 'String' },
    @{ Name = 'Group';        Source = '$FirewallRule.Group';        Type = 'String' },
    @{ Name = 'DisplayGroup'; Source = '$FirewallRule.DisplayGroup'; Type = ''       }
)
```

**Good:**
```powershell
$Parameters = @(
    @{
        Name   = 'Name'
        Source = '$FirewallRule.Name'
        Type   = 'String'
    },
    @{
        Name   = 'DisplayName'
        Source = '$FirewallRule.DisplayName'
        Type   = 'String'
    },
    @{
        Name   = 'Group'
        Source = '$FirewallRule.Group'
        Type   = 'String'
    },
    @{
        Name   = 'DisplayGroup'
        Source = '$FirewallRule.DisplayGroup'
        Type   = ''
    }
)
```
