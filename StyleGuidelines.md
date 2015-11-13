# DSC Resource Style Guidelines

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
        [String] $chanel = "operational"
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
        chanel ETW channel where message should be stored
    .EXAMPLE
        New-EtwEvent -message "Attempting to connect to server" -chanel "debug"
#>
function New-EtwEvent
{
    param 
    (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [String] $message,
        [ValidateSet("operational", "debug", "analytic")]
        [String] $chanel = "operational"
    )
    # Implementation
 }
```
