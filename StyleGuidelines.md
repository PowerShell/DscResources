# DSC Resource Style Guidelines & Best Practices

In order to provide clean and consistent code, please follow the
[style guidelines](#style-guidelines) listed below when contributing to any
[DSC Resource Kit repositories](https://github.com/PowerShell/DscResources/tree/master/xDscResources).

It is recommended to also follow the guidance from the [best practices](#best-practices)
section, although this is not required unless the module aims to meet the
[High Quality Resource Module](HighQualityModuleGuidelines.md) standards.

## Table of Contents

- [Style Guidelines](#style-guidelines)
  - [Markdown Files](#markdown-files)
  - [General](#general)
    - [Correct File Encoding](#correct-file-encoding)
    - [Descriptive Names](#descriptive-names)
    - [Correct Parameter Usage in Function and Cmdlet Calls](#correct-parameter-usage-in-function-and-cmdlet-calls)
    - [Correct Format for Arrays](#correct-format-for-arrays)
    - [Correct Format for Hashtables or Objects](#correct-format-for-hashtables-or-objects)
    - [Correct use of single- and double quotes](#correct-use-of-single--and-double-quotes)
    - [Correct Format for Comments](#correct-format-for-comments)
    - [Correct Format for Keywords](#correct-format-for-keywords)
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
  - [General Best Practices](#general-best-practices)
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
    - [Assertion Messages Start with Should](#assertion-messages-start-with-should)
    - [Context Block Messages Start with When](#context-block-messages-start-with-when)

## Style Guidelines

### Markdown Files

If a paragraph includes more than one sentence, end each sentence with a newline.
GitHub will still render the sentences as a single paragraph, but the readability
of `git diff` will be greatly improved.

### General

#### Correct File Encoding

Make sure all files are encoded using UTF-8 (not UTF-8 with BOM), except mof files
which should be encoded using ASCII.
You can use ```ConvertTo-UTF8``` and ```ConvertTo-ASCII``` to convert a file to
UTF-8 or ASCII.

#### Descriptive Names

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

#### Correct Parameter Usage in Function and Cmdlet Calls

Use named parameters for function and cmdlet calls rather than positional parameters.
Named parameters help other developers who are unfamiliar with your code to better
understand it.

When calling a function with many long parameters, use parameter splatting. If
splatting is used, then all the parameters should be in the splat.
More help on splatting can be found in the article
[About Splatting](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_splatting).

Make sure hashtable parameters are still properly formatted with multiple lines
and the proper indentation.

**Bad:**

Not using named parameters.

```powershell
Get-ChildItem C:\Documents *.md
```

**Bad:**

The call is very long and will wrap a lot in the review tool when the code is
viewed by the reviewer during the review process of the PR.

```powershell
$mySuperLongHashtableParameter = @{
    MySuperLongKey1 = 'MySuperLongValue1'
    MySuperLongKey2 = 'MySuperLongValue2'
}

$superLongVariableName = Get-MySuperLongVariablePlease -MySuperLongHashtableParameter  $mySuperLongHashtableParameter -MySuperLongStringParameter '123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890' -Verbose
```

**Bad:**

Hashtable is not following [Correct Format for Hashtables or Objects](https://github.com/PowerShell/DscResources/blob/master/StyleGuidelines.md#correct-format-for-hashtables-or-objects).

```powershell
$superLongVariableName = Get-MySuperLongVariablePlease -MySuperLongHashtableParameter @{ MySuperLongKey1 = 'MySuperLongValue1'; MySuperLongKey2 = 'MySuperLongValue2' } -MySuperLongStringParameter '123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890' -Verbose
```

**Bad:**

Hashtable is not following [Correct Format for Hashtables or Objects](https://github.com/PowerShell/DscResources/blob/master/StyleGuidelines.md#correct-format-for-hashtables-or-objects).

```powershell
$superLongVariableName = Get-MySuperLongVariablePlease -MySuperLongHashtableParameter @{ MySuperLongKey1 = 'MySuperLongValue1'; MySuperLongKey2 = 'MySuperLongValue2' } `
                                                       -MySuperLongStringParameter '123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890' `
                                                       -Verbose
```

**Bad:**

Hashtable is not following [Correct Format for Hashtables or Objects](https://github.com/PowerShell/DscResources/blob/master/StyleGuidelines.md#correct-format-for-hashtables-or-objects).

```powershell
$superLongVariableName = Get-MySuperLongVariablePlease `
    -MySuperLongHashtableParameter @{ MySuperLongKey1 = 'MySuperLongValue1'; MySuperLongKey2 = 'MySuperLongValue2' } `
    -MySuperLongStringParameter '123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890' `
    -Verbose
```

**Bad:**

Passing parameter (`Verbose`) outside of the splat.

```powershell
$getMySuperLongVariablePleaseParameters = @{
    MySuperLongHashtableParameter = @{
        MySuperLongKey1 = 'MySuperLongValue1'
        MySuperLongKey2 = 'MySuperLongValue2'
    }
    MySuperLongStringParameter = '123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890'
}

$superLongVariableName = Get-MySuperLongVariablePlease @getMySuperLongVariablePleaseParameters -Verbose
```

**Good:**

```powershell
Get-ChildItem -Path C:\Documents -Filter *.md
```

**Good:**

```powershell
$superLongVariableName = Get-MyVariablePlease -MyStringParameter '123456789012349012345678901234567890' -Verbose
```

**Good:**

```powershell
$superLongVariableName = Get-MyVariablePlease -MyString1 '1234567890' -MyString2 '1234567890' -MyString3 '1234567890' -Verbose
```

**Good:**

```powershell
$mySuperLongHashtableParameter = @{
    MySuperLongKey1 = 'MySuperLongValue1'
    MySuperLongKey2 = 'MySuperLongValue2'
}

$superLongVariableName = Get-MySuperLongVariablePlease -MySuperLongHashtableParameter $mySuperLongHashtableParameter -Verbose
```

**Good:**

Splatting all parameters.

```powershell
$getMySuperLongVariablePleaseParameters = @{
    MySuperLongHashtableParameter = @{
        MySuperLongKey1 = 'MySuperLongValue1'
        MySuperLongKey2 = 'MySuperLongValue2'
    }
    MySuperLongStringParameter = '123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890'
    Verbose = $true
}

$superLongVariableName = Get-MySuperLongVariablePlease @getMySuperLongVariablePleaseParameters
```

**Good:**

```powershell
$superLongVariableName = Get-MySuperLongVariablePlease `
    -MySuperLongHashtableParameter @{
        MySuperLongKey1 = 'MySuperLongValue1'
        MySuperLongKey2 = 'MySuperLongValue2'
    } `
    -MySuperLongStringParameter '123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890' `
    -Verbose
```

#### Correct Format for Arrays

Arrays should be written in one of the following formats.

If an array is declared on a single line, then there should be a single space
between each element in the array. If arrays written on a single line tend to be
long, please consider using one of the alternative ways of writing the array.

**Bad:**

Array elements are not format consistently.

```powershell
$array = @( 'one', `
'two', `
'three'
)
```

**Bad:**

There are no single space beetween the elements in the array.

```powershell
$array = @('one','two','three')
```

**Bad:**

There are multiple array elements on the same row.

```powershell
$array = @(
    'one', 'two', `
    'my long string example', `
    'three', 'four'
)
```

**Bad:**

Hashtable is not following [Correct Format for Hashtables or Objects](https://github.com/PowerShell/DscResources/blob/master/StyleGuidelines.md#correct-format-for-hashtables-or-objects).

```powershell
$array = @(
    'one',
    @{MyKey = 'MyValue'},
    'three'
)
```

**Bad:**

Hashtables are not following [Correct Format for Hashtables or Objects](https://github.com/PowerShell/DscResources/blob/master/StyleGuidelines.md#correct-format-for-hashtables-or-objects).

```powershell
$myArray = @(
    @{Key1 = Value1;Key2 = Value2},
    @{Key1 = Value1;Key2 = Value2}
)
```

**Good:**

```powershell
$array = @('one', 'two', 'three')
```

**Good:**

```powershell
$array = @(
    'one',
    'two',
    'three'
)
```

**Good:**

```powershell
$array = @(
    'one'
    'two'
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

**Good:**

```powershell
$hashtable = @{
    Key = "Value"
}

$array = @(
    'one',
    'two',
    'three',
    $hashtable
)
```

**Good:**

```powershell
$myArray = @(
    @{
        Key1 = Value1
        Key2 = Value2
    },
    @{
        Key1 = Value1
        Key2 = Value2
    }
)
```

#### Correct Format for Hashtables or Objects

Hashtables and Objects should be written in the following format.
Each property should be on its own line indented once.

**Bad:**

```powershell
$hashtable = @{
}
```

**Bad:**

```powershell
$hashtable = @{ }
```

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
$hashtable = @{}
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

#### Correct use of single- and double quotes

Single quotes should always be used to delimit string literals wherever possible.
Double quoted string literals may only be used when it contains ($) expressions
that need to be evaluated.

**Bad:**

```powershell
$string = "String that do not evaluate variable"
```

**Bad:**

```powershell
$string = "String that evaluate variable {0}" -f $SomeObject.SomeProperty
```

**Good:**

```powershell
$string = 'String that do not evaluate variable'
```

**Good:**

```powershell
$string = 'String that evaluate variable {0}' -f $SomeObject.SomeProperty
```

**Good:**

```powershell
$string = "String that evaluate variable $($SomeObject.SomeProperty)"
```

**Good:**

```powershell
$string = 'String that evaluate variable ''{0}''' -f $SomeObject.SomeProperty
```

**Good:**

```powershell
$string = "String that evaluate variable '{0}'" -f $SomeObject.SomeProperty
```

#### Correct Format for Comments

There should not be any commented-out code in checked-in files.
The first letter of the comment should be capitalized.

Single line comments should be on their own line and start with a single pound-sign
followed by a single space. The comment should be indented the same amount as the
following line of code.

Comments that are more than one line should use the ```<# #>``` format rather
than the single pound-sign. The opening and closing brackets should be on their
own lines. The comment inside the brackets should be indented once more than the
brackets. The brackets should be indented the same amount as the following line
of code.

Formatting help-comments for functions has a few more specific rules that can be
found [here](#all-functions-must-have-comment-based-help).

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

#### Correct Format for Keywords

PowerShell reserved Keywords should be in all lower case and should
be immediately followed by a space if there is non-whitespace characters
following (for example, an open brace).

Some reserved Keywords may also be followed by an open curly brace, for
example the `catch` keyword. These keywords that are followed by a
curly brace should also follow the [One Newline Before Braces](#one-newline-before-braces)
guideline.

The following is the current list of PowerShell reserved keywords in
PowerShell 5.1:

```powershell
begin, break, catch, class, continue, data, define do, dynamicparam, else,
elseif, end, enum, exit, filter, finally, for, foreach, from, function
hidden, if, in, inlinescript, param, process, return, static, switch,
throw, trap, try, until, using, var, while
```

This list may change in newer versions of PowerShell.

The latest list of PowerShell reserved keywords can also be found
on [this page](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_language_keywords?view=powershell-5.1).

**Bad:**

```powershell
# Missing space after keyword and before open bracket
foreach($item in $list)
```

**Bad:**

```powershell
# Capital letters in keyword
BEGIN
```

**Bad:**

```powershell
# Violates 'One Newline Before Braces' guideline
begin {
    # Do some work
}
```

**Bad:**

```powershell
# Capital letters in 'in' and 'foreach' keyword
ForEach ($item In $list)
```

**Good:**

```powershell
foreach ($item in $list)
```

**Good:**

```powershell
begin
{
    # Do some work
}
```

### Whitespace

#### Indentation

For all indentation, use **4** spaces instead of tabs.
There should be no tab characters in the file unless they are in a here-string.

#### No Trailing Whitespace After Backticks

Backticks should always be directly followed by a newline

#### Newline at End of File

All files must end with a newline, see [StackOverflow.](http://stackoverflow.com/questions/5813311/no-newline-at-end-of-file)

#### Newline Character Encoding

Save [newlines](http://en.wikipedia.org/wiki/Newline) using CR+LF instead of CR.
For interoperability reasons, we recommend that you follow [these instructions](GettingStartedWithGitHub.md#setup-git)
when installing Git on Windows so that newlines saved to GitHub are simply CRs.

#### No More Than Two Consecutive Newlines

Code should not contain more than two consecutive newlines unless they are contained
in a here-string.

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

#### One Newline Before Braces

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

When assigning to a variable, opening curly braces should be on the same line as
the assignment operator.

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

#### One Newline After Opening Brace

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

#### Two Newlines After Closing Brace

Each closing curly brace **ending** a function, conditional block, loop, etc.
should be followed by exactly two newlines unless it is directly followed by another
closing brace. If the closing brace is followed by another closing brace or continues
a conditional or switch block, there should be only one newline after the closing
brace.

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

#### One Space Between Type and Variable Name

If you must declare a variable type, type declarations should be separated from
the variable name by a single space.

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

#### One Space on Either Side of Operators

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

#### One Space Between Keyword and Parenthesis

If a keyword is followed by a parenthesis, there should be single space between
the keyword and the parenthesis.

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

### Functions

#### Function Names Use Pascal Case

Function names must use PascalCase.  This means that each concatenated word is capitalized.

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

#### Function Names Use Verb-Noun Format

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

#### Function Names Use Approved Verbs

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

#### Functions Have Comment-Based Help

All functions should have comment-based help with the correct syntax directly
above the function. Comment-help should include at least the SYNOPSIS section and
a PARAMETER section for each parameter.

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

#### Parameter Block at Top of Function

There must be a parameter block declared for every function.
The parameter block must be at the top of the function and not declared next to
the function name. Functions with no parameters should still display an empty
parameter block.

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

### Parameters

#### Correct Format for Parameter Block

- An empty parameter block should be displayed on its own line like this:
  `param ()`.
- A non-empty parameter block should have the opening and closing parentheses on
  their own line.
- All text inside the parameter block should be indented once.
- Every parameter should include the `[Parameter()]` attribute, regardless of
  whether the attribute requires decoration or not.
- A parameter that is mandatory should contain this decoration:
  `[Parameter(Mandatory = $true)]`.
- A parameter that is not mandatory should _not_ contain a `Mandatory` decoration
  in the `[Parameter()]`.

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

#### Parameter Names Use Pascal Case

All parameters must use PascalCase.  This means that each concatenated word is capitalized.

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

#### Parameters Separated by One Line

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

#### Parameter Type on Line Above

The parameter type must be on its own line above the parameter name.
If an attribute needs to follow the type, it should also have its own line between
the parameter type and the parameter name.

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

#### Parameter Attributes on Separate Lines

Parameter attributes should each have their own line.
All attributes should go above the parameter type, except those that *must* be
between the type and the name.

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

### Variables

#### Variable Names Use Camel Case

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

#### Script, Environment and Global Variable Names Include Scope

Script, environment, and global variables must always include their scope in the
variable name unless the 'using' scope is needed. The script and global scope
specifications should be all in lowercase. Script and global variable names following
the scope should use camelCase.

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

Although adoping the _best practices_ is optional, doing so will help improve the
quality of the DSC resource module.

Note: Modules that aim to meet the [High Quality Resource Module](HighQualityModuleGuidelines.md)
standards must also implement the _best practices_ whereever possible.

### General Best Practices

#### Avoid Using Hardcoded Computer Name

Using hardcoded computer names exposes sensitive information on your machine.
Use a parameter or environment variable instead if a computer name is necessary.
This comes from [this](https://github.com/PowerShell/PSScriptAnalyzer/blob/development/RuleDocumentation/AvoidUsingComputerNameHardcoded.md)
PS Script Analyzer rule.

**Bad:**

```powershell
Invoke-Command -Port 0 -ComputerName 'hardcodedName'
```

**Good:**

```powershell
Invoke-Command -Port 0 -ComputerName $env:computerName
```

#### Avoid Empty Catch Blocks

Empty catch blocks are not necessary.
Most errors should be thrown or at least acted upon in some way.
If you really don't want an error to be thrown or logged at all, use the ErrorAction
parameter with the SilentlyContinue value instead.

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

#### Ensure Null is on Left Side of Comparisons

When comparing a value to ```$null```, ```$null``` should be on the left side of
the comparison.
This is due to an issue in PowerShell.
If ```$null``` is on the right side of the comparison and the value you are comparing
it against happens to be a collection, PowerShell will return true if the collection
*contains* ```$null``` rather than if the entire collection actually *is* ```$null```.
Even if you are sure your variable will never be a collection, for consistency,
please ensure that ```$null``` is on the left side of all comparisons.

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

#### Avoid Global Variables

Avoid using global variables whenever possible.
These variables can be edited by any other script that ran before your script or
is running at the same time as your script.
Use them only with extreme caution, and try to use parameters or script/local
variables instead.

This rule has a few exceptions:

- The use of ```$global:DSCMachineStatus``` is still recommended to restart a
  machine from a DSC resource.

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

#### Use Declared Local and Script Variables More Than Once

Don't declare a local or script variable if you're not going to use it.
This creates excess code that isn't needed

#### Use PSCredential for All Credentials

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

#### Use Variables Rather Than Extensive Piping

This is a script not a console. Code should be easy to follow. There should be no
more than 1 pipe in a line. This rule is specific to the DSC Resource Kit - other
PowerShell best practices may say differently, but this is our preferred format
for readability.

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

#### Avoid Unnecessary Type Declarations

If it is clear what type a variable is then it is not necessary to explicitly
declare its type. Extra type declarations can clutter the code.

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

### Calling Functions

#### Avoid Cmdlet Aliases

When calling a function use the full command not an alias.
You can get the full command an alias represents by calling ```Get-Alias```.

**Bad:**

```powershell
ls -File $root -Recurse | ? { @('.gitignore', '.mof') -contains $_.Extension }
```

**Good:**

```Powershell
Get-ChildItem -File $root -Recurse | Where-Object -FilterScript {
    @('.gitignore', '.mof') -contains $_.Extension
}
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

#### Use the Force Parameter with Calls to ShouldContinue

**Bad:**

```powershell

```

**Good:**

```powershell

```

#### Avoid the WMI Cmdlets

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

#### Avoid Write-Host

[Write-Host is harmful](http://www.jsnover.com/blog/2013/12/07/write-host-considered-harmful/).
Use alternatives such as Write-Verbose, Write-Output, Write-Debug, etc.

**Bad:**

```powershell
Write-Host 'Setting the variable to a value.'
```

**Good:**

```powershell
Write-Verbose -Message 'Setting the variable to a value.'
```

#### Avoid ConvertTo-SecureString with AsPlainText

SecureStrings should be encrypted. When using ConvertTo-SecureString with the
`AsPlainText` parameter specified the SecureString text is not encrypted and thus
not secure. This is allowed in tests/examples when needed, but never in the actual
resources.

**Bad:**

```powershell
ConvertTo-SecureString -String 'mySecret' -AsPlainText -Force
```

#### Assign Function Results to Variables Rather Than Extensive Inline Calls

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

### Writing Functions

#### Avoid Default Values for Mandatory Parameters

Default values for mandatory parameters will always be overwritten, thus they are
never used and can cause confusion.

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

#### Avoid Default Values for Switch Parameters

Switch parameters have 2 values - there or not there.
The default value is automatically $false so it doesn't need to be declared.
If you are tempted to set the default value to $true - don't - refactor your code
instead.

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

#### Include the Force Parameter in Functions with the ShouldContinue Attribute

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

#### Define the ShouldProcess Attribute if the Function Calls ShouldProcess

**Bad:**

```powershell

```

**Good:**

```powershell

```

#### Avoid Redefining Reserved Parameters

[Reserved Parameters](https://msdn.microsoft.com/en-us/library/dd901844(v=vs.85).aspx)
such as Verbose, Debug, etc. are already added to the function at runtime so don't
redefine them. Add the CmdletBinding attribute to include the reserved parameters
in your function.

#### Use the CmdletBinding Attribute on Every Function

The CmdletBinding attribute adds the reserved parameters to your function which is
always preferable.

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

#### Define the OutputType Attribute for All Functions With Output

The OutputType attribute should be declared if the function has output so that
the correct error messages get displayed if the function ever produces an incorrect
output type.

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

#### Return Only One Object From Each Function

**Bad:**

```powershell

```

**Good:**

```powershell

```

### DSC Resource Functions

#### Return a Hashtable from Get-TargetResource

**Bad:**

```powershell

```

**Good:**

```powershell

```

#### Return a Boolean from Test-TargetResource

**Bad:**

```powershell

```

**Good:**

```powershell

```

#### Avoid Returning Anything From Set-TargetResource

**Bad:**

```powershell

```

**Good:**

```powershell

```

#### Define Get-TargetResource, Set-TargetResource, and Test-TargetResource for Every DSC Resource

**Bad:**

```powershell

```

**Good:**

```powershell

```

#### Get-TargetResource should not contain unused non-mandatory parameters

The inclusion of a non-mandatory parameter that is never used could signal that
there is a design flaw in the implementation of the `Get-TargetResource` function.
The non-mandatory parameters that are used to call `Get-TargetResource` should help
to retrieve the actual values of the properties for the resource.
For example, if there is a parameter `Ensure` that is non-mandatory, that parameter
describes the state the resource should have, but it might not be used to retrieve
the actual values.
Another example would be if a parameter `FilePathName` is set to be non-mandatory,
but `FilePathName` is actually a property that `Get-TargetResource` should return
the actual value of.
In that case it does not make sense to assign a value to `FilePathName` when
calling `Get-TargetResource` because that value will never be used.

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

#### Any unused parameters that must be included in a function definition should include 'Not used in \<function_name\>' in the help comment for that parameter in the comment-based help

The inclusion of a mandatory parameter in the 'Get-TargetResource' function that
is never used could signal that there is a design flaw in the implementation of
the function. The mandatory parameters that are used to call 'Get-TargetResource'
should help to retrieve the actual values of the properties for the resource.
For example, if there is a parameter 'Ensure' that is mandatory, that parameter
will not be used to retrieve the actual values. Another example would be if a
parameter 'FilePathName' is set to be mandatory, but 'FilePathName' is actually
a property that 'Get-TargetResource' should return the actual value of. In that
case it does not make sense to assign a value to 'FilePathName' when calling
'Get-TargetResource' because that value will never be used.

The inclusion of a mandatory or a non-mandatory parameter in the Test-TargetResource
function that is not used is more common since it is required that both the
'Set-TargetResource' and the 'Test-TargetResource' have the same parameters. Thus,
there will be times when not all of the parameters in the 'Test-TargetResource'
function will be used in the function.

If there is a need design-wise to include a mandatory parameter that will not be
used, then the comment-based help for that parameter should contain the description
'Not used in <function_name>'.

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

#### Use Identical Parameters for Set-TargetResource and Test-TargetResource

**Bad:**

```powershell

```

**Good:**

```powershell

```

#### Use Write-Verbose At Least Once in Get-TargetResource, Set-TargetResource, and Test-TargetResource

**Bad:**

```powershell

```

**Good:**

```powershell

```

#### Use *-TargetResource for Exporting DSC Resource Functions

**Bad:**

```powershell

```

**Good:**

```powershell

```

### Manifests

#### Avoid Using Deprecated Manifest Fields

**Bad:**

```powershell

```

**Good:**

```powershell

```

#### Ensure Manifest Contains Correct Fields

**Bad:**

```powershell

```

**Good:**

```powershell

```

#### Do not use NestedModules to export shared commands

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

### Localization

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

#### Localization string ID suffix

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

#### Using localization string in code

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

##### Helper functions for localization

There are also five helper functions to simplify localization. These can be
be found in the repository [DscResource.Template](https://github.com/PowerShell/DscResource.Template)
in the module script file [DscResource.LocalizationHelper](https://github.com/PowerShell/DscResource.Template/blob/master/Modules/DscResource.LocalizationHelper/DscResource.LocalizationHelper.psm1)

To use it, copy the module folder
[DscResource.LocalizationHelper](https://github.com/PowerShell/DscResource.Template/blob/master/Modules/DscResource.LocalizationHelper)
and the unit tests
[DscResource.LocalizationHelper.Tests.ps1](https://github.com/PowerShell/DscResource.Template/blob/master/Tests/Unit/DscResource.LocalizationHelper.Tests.ps1)
to the new resource module.

###### Get-LocalizedData

This should be used at the top of each resource PowerShell module script file
(.psm1).
Refer to the comment-based help for more information about this helper function.

```powershell
$script:resourceModulePath = Split-Path `
    -Path (Split-Path -Path $PSScriptRoot -Parent) `
    -Parent

$script:localizationModulePath = Join-Path `
    -Path $script:resourceModulePath `
    -ChildPath 'Modules\DscResource.LocalizationHelper'

Import-Module -Name (
    Join-Path `
        -Path $script:localizationModulePath `
        -ChildPath 'DscResource.LocalizationHelper.psm1'
    )

$script:localizedData = Get-LocalizedData -ResourceName 'MSFT_SqlSetup'
```

###### New-InvalidArgumentException

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

###### New-InvalidOperationException

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

###### New-ObjectNotFoundException

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

###### New-InvalidResultException

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

### Pester Tests

#### Capitalized Pester Assertions

Pester assertions should all start with capital letters. This makes code easier
to read.

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

#### Assertion Messages Start with Should

Pester assertions should always start with the word 'Should'. This is to ensure the
test results read more naturally as well as helping to indentify assertion messages
that aren't making assertions.

**Bad:**

```powershell
# This is not an assertive message
It 'When calling Get-TargetResource' {
    Get-TargetResource @testParameters | Should -Be 'something'
}
```

**Bad:**

```powershell
# This does not start with 'Should'
It 'Something is returned' {
    Get-TargetResource @testParameters | Should -Be 'something'
}
```

**Good:**

```powershell
It 'Should return something' {
    Get-TargetResource @testParameters | Should -Be 'something'
}
```

#### Context Block Messages Start with When

Pester test **outer** `Context` block messages should always start with the word
'When'. This is to ensure the test results read more naturally as well as helping
to indentify context messages that aren't defining context.

**Bad:**

```powershell
# Context block not using 'When'
Context 'Calling Get-TargetResource with default parameters'
    It 'Should return something' {
        Get-TargetResource @testParameters | Should -Be 'something'
    }
}
```

**Bad:**

```powershell
Context 'When calling Get-TargetResource'
    # Inner context block not using 'When'
    Context 'With default parameters'
        It 'Should return something' {
            Get-TargetResource @testParameters | Should -Be 'something'
        }
    }
}
```

**Good:**

```powershell
Context 'When Get-TargetResource is called with default parameters'
    It 'Should return something' {
        Get-TargetResource @testParameters | Should -Be 'something'
    }
}
```

**Good:**

```powershell
Context 'When Get-TargetResource is called'
    Context 'When passing default parameters'
        It 'Should return something' {
            Get-TargetResource @testParameters | Should -Be 'something'
        }
    }
}
```
