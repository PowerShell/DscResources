# DSC Resource Style Guidelines

In order to provide clean and consistent code, please follow the style guidelines listed below when contributing to any [DSC Resource Kit repositories](https://github.com/PowerShell/DscResources/tree/master/xDscResources).

## General Rules
 1. For all indentation, use 4 spaces instead of tabs
 2. Make sure all files are encoded using UTF-8, except mof files which should be in ASCII.
 3. Save [newlines](http://en.wikipedia.org/wiki/Newline) using CR+LF instead of CR.
For interoperability reasons, we recommend that you follow [these instructions](GettingStartedWithGitHub.md#setup-git) when installing Git on Windows so that newlines saved to GitHub are simply CRs.
 4. Files must end with a newline, see [StackOverflow.](http://stackoverflow.com/questions/5813311/no-newline-at-end-of-file) 

## Markdown File Guidelines
 1. If a paragraph includes more than one sentence, end each sentence with a newline.
GitHub will still render the sentences as a single paragraph, but the readability of `git diff` will be greatly improved.

## PowerShell Coding Style Guidelines
### No Multiple Blank Lines
Code should not contain multiple blank lines in a row.

**Bad:**
```powershell
function Get-MyValue
{
    Write-Verbose 'Getting MyValue'


    return $MyValue
}
```

**Good:**
```powershell
function Get-MyValue
{
    Write-Verbose 'Getting MyValue'
    return $MyValue
}
```

### No Blank Line After Brace
Opening curly braces should not be followed by a blank line.

**Bad:**
```powershell
function Get-MyValue
{

    Write-Verbose 'Getting MyValue'

    return $MyValue
}
```

**Good:**
```powershell
Function Get-MyValue
{
    Write-Verbose 'Getting MyValue'
    return $MyValue
}
```

### Braces on Following Line
Curly braces should be on the following line unless assigning to a variable.

**Bad:**
```powershell
if ($booleanValue) {
    Write-Verbose "Boolean is $booleanValue"
}
```

**Good:**
```powershell
if ($booleanValue)
{
    Write-Verbose "Boolean is $booleanValue"
}
```

When assigning to a variable, opening curly braces should be on the same line.

**Bad:**
```powershell
$scriptBlockVariable =
{
    Write-Verbose 'Executing script block'
}
```

**Bad:**
```powershell
$hashtableVariable =
@{
    Key1 = 'Value1'
    Key2 = 'Value2'
}
```

**Good:**
```powershell
$scriptBlockVariable = {
    Write-Verbose 'Executing script block'
}
```

**Good:**
```powershell
$hashtableVariable = @{
    Key1 = 'Value1'
    Key2 = 'Value2'
}
```

### Line Character Limit
Each line should have less than **100** characters.

**Bad:**
```powershell```
$reallyLongString = '123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890'
```

**Good:**
```powershell```
$reallyLongString = '123456789012345678901234567890123456789012345678901234567890' + `
    '123456789012345678901234567890123456789012345678901234567890'
```

### Correct Format for Long Function Calls
When calling a function with many parameters, if the line exceeds the line character limit, separate each parameter onto its own line.
Make sure hashtable parameters are also properly formatted with multiple lines and the proper indentation.

**Bad:**
```powershell
$superLongVariableName = Get-MySuperLongVariablePlease -MySuperLongHashtableParameter @{ MySuperLongKey1 = 'MySuperLongValue1'; MySuperLongKey2 = 'MySuperLongValue2' } -MySuperLongStringParameter '123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890' -Verbose
```

**Good:**
```powershell
$superLongVariableName = Get-MySuperLongVariablePlease `
    -MySuperLongHashtableParameter @{ 
        MySuperLongKey1 = 'MySuperLongValue1'
        MySuperLongKey2 = 'MySuperLongValue2'
    } `
    -MySuperLongStringParameter '12345678901234567890123456789012345678901234567890' + `         
        '1234567890123456789012345678901234567890123456789012345678901234567890' `
    -Verbose
```

### Descriptive Variable Names 
Use descriptive, clear, and full names.
All variable names must be at least more than **2** characters.
No abbreviations.

**Bad:**
```powershell
$r = Get-RdsHost
```

**Bad:**
```powershell
$frtytw = 42
```

**Good:**
```powershell
$remoteDesktopSessionHost = Get-RemoteDesktopSessionHost
```

**Bad:**
```powershell
$fileCharacterLimit = 42
```

### Use Pascal Case for Function Names
Function names should use PascalCase and follow Noun-Verb convention if possible

**Bad:**
```powershell
function get-targetresource
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

### Function Names Must Use Verb-Noun Format
All function names must follow the standard PowerShell Verb-Noun format.

**Bad:**
```powershell
function TargetResourceGetter
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

### Function Names Must Use Approved Verbs
All function names must use [approved verbs](https://msdn.microsoft.com/en-us/library/ms714428(v=vs.85).aspx).

**Bad:**
```powershell
function Normalize-String
{
    # ...
}
```

**Good:**
```powershell
function ConvertTo-NormalizedString
{
    # ...
}
```

### Parameter Names Should Use Pascal Case
All parameters should use PascalCase.

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

**Bad:**
```powershell
function Get-TargetResource
{
    [CmdletBinding()]
    param
    (
        $sourcepath
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

### Parameter Type on Same Line
The parameter type should be on the same line as the parameter name.
For now, a type of PSCredential needs to go on a separate line above the parameter followed by another separate line with the Credential parameter.

**Bad:**
```powershell
function Get-TargetResource
{
    [CmdletBinding()]
    param
    (
        [String]
        $SourcePath = 'c:\'
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

**Good:**
```powershell
function Get-TargetResource
{
    [CmdletBinding()]
    param
    (
        [PSCredential] 
        [Credential()]
        $MyCredential
    )
}
```

### Space Between Type and Name
Parameter or variable type declarations should be separated from the parameter or variable name by a single space

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

### Parameters Separated by One Line
Parameters should be separated by a single line.

**Bad:**
```powershell
function New-Event
{
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [String] $Message,
        [ValidateSet('operational', 'debug', 'analytic')]
        [String] $Channel = 'operational'
    )
}
```

**Good:**
```powershell
function New-Event
{
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [String] $Message,

        [ValidateSet('operational', 'debug', 'analytic')]
        [String] $Channel = 'operational'
    )
}
```

### Parameter Attributes on Separate Lines
Parameter attributes should each have their own line.

**Bad:**
```powershell
function New-Event
{
    param
    (
        [Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][String] $Message,

        [ValidateSet('operational', 'debug', 'analytic')][String] $Channel = 'operational'
    )
}
```

**Good:**
```powershell
function New-Event
{
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [String] $Message,

        [ValidateSet('operational', 'debug', 'analytic')]
        [String] $Channel = 'operational'
    )
}
```

### Variable Names Use Camel Case
Variable names should use camelCase.

**Bad:**
```powershell
function Write-Log
{
    $VerboseMessage = 'New log message'
    Write-Verbose $VerboseMessage
}
```

**Bad:**
```powershell
function Write-Log
{
    $verbosemessage = 'New log message'
    Write-Verbose $verbosemessage
}
```

**Good:**
```powershell
function Write-Log
{
    $verboseMessage = 'New log message'
    Write-Verbose $verboseMessage
}
```

### All Functions Have Comment-Based Help
All functions should have comment-based help with the correct syntax directly above the function.
Comment-help should include at least the SYNOPSIS section and a PARAMETER section for each parameter.

**Bad:**
```powershell
# Creates an event
function New-Event
{
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [String] $Message,

        [ValidateSet('operational', 'debug', 'analytic')]
        [String] $Channel = 'operational'
    )
    # Implementation...
}
```

**Good:**
```powershell
<#
    .SYNOPSIS
        Creates an event
    
    .PARAMETER Message
        Message to write
        
    .PARAMETER Channel
        Channel where message should be stored
        
    .EXAMPLE
        New-Event -Message 'Attempting to connect to server' -Channel 'debug'
#>
function New-Event
{
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [String] $Message,

        [ValidateSet('operational', 'debug', 'analytic')]
        [String] $Channel = 'operational'
    )
    # Implementation
}
```

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

### Correct Format for Hashtables or Objects
Hashtables and Objects should be written in the following format.
Each property should be on its own line indented once.

**Bad**:
```powershell
$hashtable = @{Key1 = 'Value1';Key2 = 2;Key3 = '3'}
```

**Bad**:
```powershell
$hashtable = @{ Key1 = 'Value1'
Key2 = 2
Key3 = '3' }
```

**Good**:
```powershell
$hashtable = @{
    Key1 = 'Value1'
    Key2 = 2
    Key3 = '3'
}
```

**Good**:
```powershell
$hashtable = @{
    Key1 = 'Value1'
    Key2 = 2
    Key3 = @{
        Key3Key1 = 'ExampleText'
        Key3Key2 = 42
    }
}
```

### Correct Format for Arrays
Arrays should be written in the following format.
Arrays should be writen on one line unless they exceed the line character limit.
There should be a single space between each element in the array.
Hashtables should not be declared inside an array.

**Bad**:
```powershell
$array = @( 'one', `
'two', `
'three' 
)
```

**Good**:
```powershell
$hashtable = @{
    Key = "Value"
}

$array = @( 'one', 'two', 'three', $hashtable )
```

### Do Not Use Cmdlet Aliases
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
