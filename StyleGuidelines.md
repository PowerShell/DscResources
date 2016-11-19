# DSC Resource Style Guidelines

In order to provide clean and consistent code, please follow the style guidelines listed below when contributing to any [DSC Resource Kit repositories](https://github.com/PowerShell/DscResources/tree/master/xDscResources).

## Table of Contents

- [Markdown Files](#markdown-files)
- [General](#general)
- [Correct File Encoding](#correct-file-encoding)
  - [Descriptive Names](#descriptive-names)
  - [Correct Format for Long Function Calls](#correct-format-for-long-function-calls)
  - [Correct Format for Arrays](#correct-format-for-arrays)
  - [Correct Format for Hashtables or Objects](#correct-format-for-hashtables-or-objects)
  - [Correct Format for Comments](#correct-format-for-comments)
- [Whitespace](#whitespace)
  - [Indentation](#indentation)
  - [No Trailing Whitespace After Backticks](#no-trailing-whitespace-after-backticks)
  - [Newline at End of File](#newline-at-end-of-file)
  - [Newline Character Encoding](#newline-character-encoding)
  - [No More Than Two Consecutive Newlines](#no-more-than-two-consecutive-newlines)
  - [One Newline Before Braces](#one-newline-before-braces)
  - [One Newline After Opening Brace](#one-newline-after-opening-brace)
  - [Two Newlines After Closing Brace](#two-newlines-after-closing-brace)
  - [One Space Between Type and Variable Name](#one-space-between-type-and-variable-name)
  - [One Space on Either Side of Operators](#one-space-on-either-side-of-operators)
  - [One Space Between Keyword and Parenthesis](#one-space-between-keyword-and-parenthesis)
- [Functions](#functions)
  - [Function Names Use Pascal Case](#function-names-use-pascal-case)
  - [Function Names Use Verb-Noun Format](#function-names-use-verb-noun-format)
  - [Function Names Use Approved Verbs](#function-names-use-approved-verbs)
  - [Functions Have Comment-Based Help](#functions-have-comment-based-help)
  - [Parameter Block at Top of Function](#parameter-block-at-top-of-function)
- [Parameters](#parameters)
  - [Correct Format for Parameter Block](#correct-format-for-parameter-block)
  - [Parameter Names Use Pascal Case](#parameter-names-use-pascal-case)
  - [Parameters Separated by One Line](#parameters-separated-by-one-line)
  - [Parameter Type on Line Above](#parameter-type-on-line-above)
  - [Parameter Attributes on Separate Lines](#parameter-attributes-on-separate-lines)
- [Variables](#variables)
  - [Variable Names Use Camel Case](#variable-names-use-camel-case)
  - [Script, Environment and Global Variable Names Include Scope](#script-environment-and-global-variable-names-include-scope)
- [Best Practices](#best-practices)
  - [Named Parameters Instead of Positional Parameters](#named-parameters-instead-of-positional-parameters)
  - [No Cmdlet Aliases](#no-cmdlet-aliases)
  - [No Backslash in Paths](#no-backslash-in-paths)

## Markdown Files

If a paragraph includes more than one sentence, end each sentence with a newline.
GitHub will still render the sentences as a single paragraph, but the readability of `git diff` will be greatly improved.

## General

### Correct File Encoding

Make sure all files are encoded using UTF-8, except mof files which should be encoded using ASCII.
You can use ```ConvertTo-UTF8``` and ```ConvertTo-ASCII``` to convert a file to UTF-8 or ASCII.

### Descriptive Names

Use descriptive, clear, and full names for all variables, parameters, and functions.
All names must be at least more than **2** characters.
No abbreviations should be used.

**Bad:**

```powershell
$r = Get-RdsHost
```

**Bad:**

```powershell
$frtytw = 42
```

**Bad:**

```powershell
function Get-Thing
{
    ...
}
```

**Bad:**

```powershell
function Set-ServerName
{
    param
    (
        $mySTU
    )
    ...
}
```

**Good:**

```powershell
$remoteDesktopSessionHost = Get-RemoteDesktopSessionHost
```

**Good:**

```powershell
$fileCharacterLimit = 42
```

**Good:**

```powershell
function Get-ArchiveFileHandle
{
    ...
}
```

**Good:**

```powershell
function Set-ServerName
{
    param
    (
        [Parameter()]
        $myServerToUse
    )
    ...
}
```

### Correct Format for Long Function Calls

When calling a function with many long parameters, use parameter splatting.
More help on splatting can be found using the command:

```powershell
Get-Help -Name 'About_Splatting'
```

Make sure hashtable parameters are still properly formatted with multiple lines and the proper indentation.

**Bad:**

```powershell
$superLongVariableName = Get-MySuperLongVariablePlease -MySuperLongHashtableParameter @{ MySuperLongKey1 = 'MySuperLongValue1'; MySuperLongKey2 = 'MySuperLongValue2' } -MySuperLongStringParameter '123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890' -Verbose
```

**Good:**

```powershell
$getMySuperLongVariablePleaseParams = @{
    MySuperLongHashtableParameter = @{
        mySuperLongKey1 = 'MySuperLongValue1'
        mySuperLongKey2 = 'MySuperLongValue2'
    }
    MySuperLongStringParameter = '123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890'
    Verbose = $true
}

$superLongVariableName = Get-MySuperLongVariablePlease @getMySuperLongVariablePleaseParams
```

### Correct Format for Arrays

Arrays should be written in the following format.
Arrays should be writen on one line unless they exceed the line character limit.
There should be a single space between each element in the array.
Hashtables should not be declared inside an array.

**Bad:**

```powershell
$array = @( 'one', `
'two', `
'three'
)
```

**Good:**

```powershell
$hashtable = @{
    Key = "Value"
}

$array = @( 'one', 'two', 'three', $hashtable )
```

### Correct Format for Hashtables or Objects

Hashtables and Objects should be written in the following format.
Each property should be on its own line indented once.

**Bad:**

```powershell
$hashtable = @{Key1 = 'Value1';Key2 = 2;Key3 = '3'}
```

**Bad:**

```powershell
$hashtable = @{ Key1 = 'Value1'
Key2 = 2
Key3 = '3' }
```

**Good:**

```powershell
$hashtable = @{
    Key1 = 'Value1'
    Key2 = 2
    Key3 = '3'
}
```

**Good:**

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

### Correct Format for Comments

There should not be any commented-out code in checked-in files.
The first letter of the comment should be captialized.

Single line comments should be on their own line and start with a single pound-sign followed by a single space.
The comment should be indented the same amount as the following line of code.

Comments that are more than one line should use the ```<# #>``` format rather than the single pound-sign.
The opening and closing brackets should be on their own lines.
The comment inside the brackets should be indented once more than the brackets.
The brackets should be indented the same amount as the following line of code.

Formatting help-comments for functions has a few more specific rules that can be found [here](#all-functions-must-have-comment-based-help).

**Bad:**

```powershell
function Get-MyVariable
{#this is a bad comment
    [CmdletBinding()]
    param ()
#this is a bad comment
    foreach ($example in $examples)
    {
        Write-Verbose -Message $example #this is a bad comment
    }
}
```

**Bad:**

```powershell
function Get-MyVariable
{
    [CmdletBinding()]
    param ()

    # this is a bad comment
    # On multiple lines
    foreach ($example in $examples)
    {
        # No commented-out code!
        # Write-Verbose -Message $example
    }
}
```

**Good:**

```powershell
function Get-MyVariable
{
    # This is a good comment
    [CmdletBinding()]
    param ()

    # This is a good comment
    foreach ($example in $examples)
    {
        # This is a good comment
        Write-Verbose -Message $example
    }
}
```

**Good:**

```powershell
function Get-MyVariable
{
    [CmdletBinding()]
    param ()

    <#
        This is a good comment
        on multiple lines
    #>
    foreach ($example in $examples)
    {
        Write-Verbose -Message $example
    }
}
```

## Whitespace

### Indentation

For all indentation, use **4** spaces instead of tabs.
There should be no tab characters in the file unless they are in a here-string.

### No Trailing Whitespace After Backticks

Backticks should always be directly followed by a newline

### Newline at End of File

All files must end with a newline, see [StackOverflow.](http://stackoverflow.com/questions/5813311/no-newline-at-end-of-file)

### Newline Character Encoding

Save [newlines](http://en.wikipedia.org/wiki/Newline) using CR+LF instead of CR.
For interoperability reasons, we recommend that you follow [these instructions](GettingStartedWithGitHub.md#setup-git) when installing Git on Windows so that newlines saved to GitHub are simply CRs.

### No More Than Two Consecutive Newlines

Code should not contain more than two consecutive newlines unless they are contained in a here-string.

**Bad:**

```powershell
function Get-MyValue
{
    Write-Verbose -Message 'Getting MyValue'


    return $MyValue
}
```

**Bad:**

```powershell
function Get-MyValue
{
    Write-Verbose -Message 'Getting MyValue'
    return $MyValue
}



function Write-Log
{
    Write-Verbose -Message 'Logging...'
}
```

**Good:**

```powershell
function Get-MyValue
{
    Write-Verbose -Message 'Getting MyValue'
    return $MyValue
}
```

**Good:**

```powershell
function Get-MyValue
{
    Write-Verbose -Message 'Getting MyValue'
    return $MyValue
}

function Write-Log
{
    Write-Verbose -Message 'Logging...'
}
```

### One Newline Before Braces

Each curly brace should be preceded by a newline unless assigning to a variable.

**Bad:**

```powershell
if ($booleanValue) {
    Write-Verbose -Message "Boolean is $booleanValue"
}
```

**Good:**

```powershell
if ($booleanValue)
{
    Write-Verbose -Message "Boolean is $booleanValue"
}
```

When assigning to a variable, opening curly braces should be on the same line as the assignment operator.

**Bad:**

```powershell
$scriptBlockVariable =
{
    Write-Verbose -Message 'Executing script block'
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
    Write-Verbose -Message 'Executing script block'
}
```

**Good:**

```powershell
$hashtableVariable = @{
    Key1 = 'Value1'
    Key2 = 'Value2'
}
```

### One Newline After Opening Brace

Each opening curly brace should be followed by only one newline.

**Bad:**

```powershell
function Get-MyValue
{

    Write-Verbose -Message 'Getting MyValue'

    return $MyValue
}
```

**Bad:**

```powershell
function Get-MyValue
{ Write-Verbose -Message 'Getting MyValue'

    return $MyValue
}
```

**Good:**

```powershell
function Get-MyValue
{
    Write-Verbose -Message 'Getting MyValue'
    return $MyValue
}
```

### Two Newlines After Closing Brace

Each closing curly brace **ending** a function, conditional block, loop, etc. should be followed by exactly two newlines unless it is directly followed by another closing brace.
If the closing brace is followed by another closing brace or continues a conditional or switch block, there should be only one newline after the closing brace.

**Bad:**

```powershell
function Get-MyValue
{
    Write-Verbose -Message 'Getting MyValue'
    return $MyValue
} Get-MyValue
```

**Bad:**

```powershell
function Get-MyValue
{ Write-Verbose -Message 'Getting MyValue'

    if ($myBoolean)
    {
        return $MyValue
    }

    else
    {
        return 0
    }

}
Get-MyValue
```

**Good:**

```powershell
function Get-MyValue
{
    Write-Verbose -Message 'Getting MyValue'

    if ($myBoolean)
    {
        return $MyValue
    }
    else
    {
        return 0
    }
}

Get-MyValue
```

### One Space Between Type and Variable Name

If you must declare a variable type, type declarations should be separated from the variable name by a single space.

**Bad:**

```powershell
function Get-TargetResource
{
    [CmdletBinding()]
    param ()

    [Int]$number = 2
}
```

**Good:**

```powershell
function Get-TargetResource
{
    [CmdletBinding()]
    param ()

    [Int] $number = 2
}
```

### One Space on Either Side of Operators

There should be one blank space on either side of all operators.

**Bad:**

```powershell
function Get-TargetResource
{
    [CmdletBinding()]
    param ()

    $number=2+4-5*9/6
}
```

**Bad:**

```powershell
function Get-TargetResource
{
    [CmdletBinding()]
    param ()

    if ('example'-eq'example'-or'magic')
    {
        Write-Verbose -Message 'Example found.'
    }
}
```

**Good:**

```powershell
function Get-TargetResource
{
    [CmdletBinding()]
    param ()

    $number = 2 + 4 - 5 * 9 / 6
}
```

**Good:**

```powershell
function Get-TargetResource
{
    [CmdletBinding()]
    param ()

    if ('example' -eq 'example' -or 'magic')
    {
        Write-Verbose -Message 'Example found.'
    }
}
```

### One Space Between Keyword and Parenthesis

If a keyword is followed by a parenthesis, there should be single space between the keyword and the parenthesis.

**Bad:**

```powershell
function Get-TargetResource
{
    [CmdletBinding()]
    param ()

    if('example' -eq 'example' -or 'magic')
    {
        Write-Verbose -Message 'Example found.'
    }

    foreach($example in $examples)
    {
        Write-Verbose -Message $example
    }
}
```

**Good:**

```powershell
function Get-TargetResource
{
    [CmdletBinding()]
    param ()

    if ('example' -eq 'example' -or 'magic')
    {
        Write-Verbose -Message 'Example found.'
    }

    foreach ($example in $examples)
    {
        Write-Verbose -Message $example
    }
}
```

## Functions

### Function Names Use Pascal Case

Function names must use PascalCase.

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

### Function Names Use Verb-Noun Format

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

### Function Names Use Approved Verbs

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

### Functions Have Comment-Based Help

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
        [String]
        $Message,

        [Parameter()]
        [ValidateSet('operational', 'debug', 'analytic')]
        [String]
        $Channel = 'operational'
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
        [String]
        $Message,

        [Parameter()]
        [ValidateSet('operational', 'debug', 'analytic')]
        [String]
        $Channel = 'operational'
    )
    # Implementation
}
```

### Parameter Block at Top of Function

There must be a parameter block decalred for every function.
The parameter block must be at the top of the function and not declared next to the function name.
Functions with no parameters should still display an empty parameter block.

**Bad:**

```powershell
function Write-Text([Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][String]$Text)
{
    Write-Verbose -Message $Text
}
```

**Bad:**

```powershell
function Write-Nothing
{
    Write-Verbose -Message 'Nothing'
}
```

**Good:**

```powershell
function Write-Text
{
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [String]
        $Text
    )

    Write-Verbose -Message $Text
}
```

**Good:**

```powershell
function Write-Nothing
{
    param ()

    Write-Verbose -Message 'Nothing'
}
```

## Parameters

### Correct Format for Parameter Block

- An empty parameter block should be displayed on its own line like this: `param ()`.
- A non-empty parameter block should have the opening and closing parentheses on their own line.
- All text inside the parameter block should be indented once.
- Every parameter should include the `[Parameter()]` attribute, regardless of whether the attribute requires decoration or not.
- A parameter that is mandatory should contain this decoration: `[Parameter(Mandatory = $true)]`.
- A parameter that is not mandatory should _not_ contain a `Mandatory` decoration in the `[Parameter()]`.

**Bad:**

```powershell
function Write-Nothing
{
    param
    (

    )

    Write-Verbose -Message 'Nothing'
}
```

**Bad:**

```powershell
function Write-Text
{
    param([Parameter(Mandatory = $true)]
[ValidateNotNullOrEmpty()]
                    [String] $Text )

    Write-Verbose -Message $Text
}
```

**Bad:**

```powershell
function Write-Text
{
    param
    (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [String]
        $Text

        [Parameter(Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [String]
        $PrefixText

        [Boolean]
        $AsWarning = $false
    )

    if ($AsWarning)
    {
        Write-Warning -Message "$PrefixText - $Text"
    }
    else
    {
        Write-Verbose -Message "$PrefixText - $Text"
    }
}
```

**Good:**

```powershell
function Write-Nothing
{
    param ()

    Write-Verbose -Message 'Nothing'
}
```

**Good:**

```powershell
function Write-Text
{
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [String]
        $Text
    )

    Write-Verbose -Message $Text
}
```

**Good:**

```powershell
function Write-Text
{
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [String]
        $Text

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [String]
        $PrefixText

        [Parameter()]
        [Boolean]
        $AsWarning = $false
    )

    if ($AsWarning)
    {
        Write-Warning -Message "$PrefixText - $Text"
    }
    else
    {
        Write-Verbose -Message "$PrefixText - $Text"
    }
}
```

### Parameter Names Use Pascal Case

All parameters must use PascalCase.

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
        [Parameter()]
        $SourcePath
    )
}
```

### Parameters Separated by One Line

Parameters must be separated by a single, blank line.

**Bad:**

```powershell
function New-Event
{
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [String]
        $Message,
        [ValidateSet('operational', 'debug', 'analytic')]
        [String]
        $Channel = 'operational'
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
        [String]
        $Message,

        [Parameter()]
        [ValidateSet('operational', 'debug', 'analytic')]
        [String]
        $Channel = 'operational'
    )
}
```

### Parameter Type on Line Above

The parameter type must be on its own line above the parameter name.
If an attribute needs to follow the type, it should also have its own line between the parameter type and the parameter name.

**Bad:**

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
        [Parameter()]
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
        [Parameter()]
        [PSCredential]
        [Credential()]
        $MyCredential
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
        [String]
        $Message,

        [Parameter()]
        [ValidateSet('operational', 'debug', 'analytic')]
        [String]
        $Channel = 'operational'
    )
}
```

### Parameter Attributes on Separate Lines

Parameter attributes should each have their own line.
All attributes should go above the parameter type, except those that *must* be between the type and the name.

**Bad:**

```powershell
function New-Event
{
    param
    (
        [Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][String]
        $Message,

        [ValidateSet('operational', 'debug', 'analytic')][String]
        $Channel = 'operational'
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
        [String]
        $Message,

        [Parameter()]
        [ValidateSet('operational', 'debug', 'analytic')]
        [String]
        $Channel = 'operational'
    )
}
```

## Variables

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

### Script, Environment and Global Variable Names Include Scope

Script, environment, and global variables must always include their scope in the variable name unless the 'using' scope is needed.
The script and global scope specifications should be all in lowercase.
Script and global variable names following the scope should use camelCase.

**Bad:**

```powershell
$fileCount = 0
$GLOBAL:MYRESOURCENAME = 'MyResource'

function New-File
{
    $fileCount++
    Write-Verbose -Message "Adding file to $MYRESOURCENAME to $ENV:COMPUTERNAME."
}
```

**Good:**

```powershell
$script:fileCount = 0
$global:myResourceName = 'MyResource'

function New-File
{
    $script:fileCount++
    Write-Verbose -Message "Adding file to $global:myResourceName to $env:computerName."
}
```

## Best Practices

### Named Parameters Instead of Positional Parameters

Call cmdlets using named parameters instead of positional parameters.

**Bad:**

```powershell
Get-ChildItem C:\Documents *.md
```

**Good:**

```powershell
Get-ChildItem -Path C:\Documents -Filter *.md
```

### No Cmdlet Aliases

When calling a function use the full command not an alias.
You can get the full command an alias is using by calling ```Get-Alias```.

**Bad:**

```powershell
ls -File $root -Recurse | ? { @('.gitignore', '.mof') -contains $_.Extension }
```

**Good:**

```powershell
Get-ChildItem -File $root -Recurse | Where-Object { @('.gitignore', '.mof') -contains $_.Extension }
```

### No Backslash in Paths

To support the possibility of cross-platform use in the future, backslashes should not be used within a path. Instead `Join-Path` and `Split-Path` should be used to build a path.

**Bad:**

```powershell
$currentPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Import-Module -Name "$currentPath\..\..\CommonResourceHelper.psm1"
```

**Good:**

```powershell
$currentPath = Split-Path -Path $MyInvocation.MyCommand.Path -Parent
$modulePath = (Join-Path -Path (Split-Path -Path (Split-Path -Path $currentPath -Parent) -Parent) `
                         -ChildPath 'CommonResourceHelper.psm1')
Import-Module -Name $modulePath
```
