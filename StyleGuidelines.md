# DSC Resource Style Guidelines

In order to provide clean and consistent code, please follow the style guidelines listed below when contributing to any [DSC Resource Kit repositories](https://github.com/PowerShell/DscResources/tree/master/xDscResources).

## Markdown Files
If a paragraph includes more than one sentence, end each sentence with a newline.
GitHub will still render the sentences as a single paragraph, but the readability of `git diff` will be greatly improved.

## General
### Correct File Encoding
Make sure all files are encoded using UTF-8, except mof files which should be encoded using ASCII.  
You can use ```ConvertTo-UTF8``` and ```ConvertTo-ASCII``` to convert a file to UTF-8 or ASCII.

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
        $myServerToUse
    )
    ...
}
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

**Bad**:
```powershell
function Get-MyVariable
{#this is a bad comment
    [CmdletBinding()]
    param ()
#this is a bad comment
    foreach ($example in $examples)
    {
        Write-Verbose -Message $example #this is a bad comment
    }#this is a bad comment
}
```

**Bad**:
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
    
<# This is a bad comment
     On multiple lines #>
}
```

**Good**:
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
    
    # This is a good comment
}
```

**Good**:
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
    
    <# 
        This is a good comment
        On multiple lines 
    #>
}
```

## Whitespace
### Indentation 
For all indentation, use 4 spaces instead of tabs.
There should be no tab characters in the file unless they in a here-string.

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
Each closing curly brace should be followed by exactly two newlines.

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

    return $MyValue
}
Get-MyValue
```

**Good:**
```powershell
function Get-MyValue
{
    Write-Verbose -Message 'Getting MyValue'
    return $MyValue
}

Get-MyValue
```

### One Space Between Type and Variable or Parameter Name
Parameter or variable type declarations should be separated from the parameter or variable name by a single space.

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

### Parameter Block at Top of Function
There must be a parameter block decalred for every function.
The parameter block must be at the top of the function and not declared next to the function name.
Functions with no parameters should still display an empty parameter block.

**Bad**:
```powershell
function Write-Text([Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][String]$Text)
{
    Write-Verbose -Message $Text
}
```

**Bad**:
```powershell
function Write-Nothing
{
    Write-Verbose -Message 'Nothing'
}
```

**Good**:
```powershell
function Write-Text
{
    param 
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [String] $Text
    )
    
    Write-Verbose -Message $Text
}
```

**Good**:
```powershell
function Write-Nothing
{
    param ()
    
    Write-Verbose -Message 'Nothing'
}
```

## Parameters
### Correct Format for Parameter Block
An empty parameter block should be displayed on its own line like this: ```param ()```
Otherwise, the opening and closing parentheses should each be on their own line.
All text inside the parameter block should be indented once.

**Bad**:
```powershell
function Write-Nothing
{
    param 
    (
    
    )
    
    Write-Verbose -Message 'Nothing'
}
```

**Bad**:
```powershell
function Write-Text
{
    param([Parameter(Mandatory = $true)]
[ValidateNotNullOrEmpty()]
                    [String] $Text )
    
    Write-Verbose -Message $Text
}
```

**Good**:
```powershell
function Write-Nothing
{
    param ()
    
    Write-Verbose -Message 'Nothing'
}
```

**Good**:
```powershell
function Write-Text
{
    param 
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [String] $Text
    )
    
    Write-Verbose -Message $Text
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
        [String] $Message,
        [ValidateSet('operational', 'debug', 'analytic')]
        [String] $Channel = 'operational'
    )
}
```

### Parameter Type on Same Line
The parameter type must be on the same line as the parameter name.
For now, a type of PSCredential can go on a separate line above the parameter followed by another separate line with the Credential attribute.

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

### Script and Global Variable Names Include Scope
Script and global variables must always include their scope in the variable name unless the 'using' scope is needed.
The script and global scope specifications should be all in lowercase.
Script and global variable names following the scope should use camelCase.

**Bad:**
```powershell
$fileCount = 0
$GLOBAL:MYRESOURCENAME = 'MyResource'

function New-File
{
    $fileCount++
    Write-Verbose -Message "Adding file to $MYRESOURCENAME."
}
```

**Good:**
```powershell
$script:fileCount = 0
$global:myResourceName = 'MyResource'

function New-File
{
    $script:fileCount++
    Write-Verbose -Message "Adding file to $global:myResourceName."
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

**Bad**
```powershell
ls -File $root -Recurse | ? { @('.gitignore', '.mof') -contains $_.Extension }
```

**Good** 
```Powershell
Get-ChildItem -File $root -Recurse | Where-Object { @('.gitignore', '.mof') -contains $_.Extension } 
```
