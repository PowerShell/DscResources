# Getting started with Pester

Whether your script is one or one thousand lines, if you make a change to it, you will want to test
it to make sure that it still does what it is supposed to do. Instead of manually testing your
script, you want to have test automation written to do that work for you. This will help you
remember what a particular piece of code is supposed to do and is known as reducing
[technical debt](https://en.wikipedia.org/wiki/Technical_debt). When you contribute to a community
and create code that other people need to be able to read, understand, and depend on, it becomes
even more important to automate testing to validate every change. Another way to look it this is
that, Pester can remember and tell the story of your code, so you don't have to.

There are a lot of the examples that demonstrate Pester functionality, but not necessarily the
concepts or value that automated testing adds to a project. The best way to learn and understand
these concepts is through examples and discussion of their value. The script examples here are very
basic so that we can focus on testing with Pester and writing solid tests. Before we get started,
here are a few points about the different types of testing.

## Unit vs. Integration Testing

Don't get bogged down in the details of these terms, but you do need to understand the fundamental
difference.

### Unit Testing

[Unit Testing](https://en.wikipedia.org/wiki/Unit_testing) is a software testing method by which
individual units of source code, sets of one or more computer program modules together with
associated control data, usage procedures, and operating procedures, are tested to determine
whether they are fit for use.

Simply put, Unit testing tests individual components of your scripts such as a function, in
isolation to validate behavior. We will demonstrate what that means in this guide.

** [Linting](https://en.wikipedia.org/wiki/Lint_(software)) is not something that applies to
Pester directly, but the concept of Lint testing still applies. We want to automatically discover
code that has a high probability of causing problems, so that we can eliminate it. In PowerShell, we
have [PSScriptAnalyzer](https://github.com/PowerShell/PSScriptAnalyzer), which can be wrapped in
Pester test code and displayed inline with the rest of your test results.

### Integration Testing

[Integration testing](https://en.wikipedia.org/wiki/Integration_testing) is the phase in software
testing in which individual software modules are combined and tested as a group. It occurs after
unit testing and before validation testing.

After you have tested all of your functions in isolation, it is time to test them when they call
other functions or scripts to verify the behavior.

## Important test concepts

In order for any of this work to provide value to a project and anyone who contributes, it needs to
be three things: Readable, Trustworthy, and Maintainable. Those are fairly subjective, so it
is important to have a core description as to what they mean to a community as well as individuals.

### Readable

This is important for both you and anyone that will review your code now and in the future.

* The [KISS principal](https://en.wikipedia.org/wiki/KISS_principle) is highly applicable.
* As a general rule, don't put logic such as loops or conditions in your tests.
* Name your tests in a way that makes sense. This is important so that when a
  test fails, you will know more specifically what has failed.

### Trustworthy

* Know what you are trying to prove with your test
* Validate that your test passes and fails in expected ways.
* You won't be confident in your test results if they succeed or fail unexpectedly.

### Maintainable

* The same principles that are applied to the code you are testing apply to your test code.
* Just like being specific with the test name, make sure that you are only testing
  what the test name says you are testing.

Calling your work a project from the very beginning helps you move your thinking beyond just writing
a simple script. As stated earlier, your script may still be simple, but if you put any dependency
on it, it becomes a cog in a system. If that cog breaks, it can cause problems in other places, or
bring down the whole thing. Linking automated processes together is the heart of DevOps and why
solid testing is so important.

## Pester

If you are running Windows 10, you already have Pester installed, but it is still a good idea to
update to the latest version. Pester shipped in Windows, so you cannot use the Update-Module
cmdlet. Since PowerShell already sees that Pester is installed, you need to run
`'Install-Module Pester -Force'` This will add the most recent version of Pester to your
system and allow you to use the Update-Module in the future. Now that we are working with the most
recent version of Pester, let's look at an example module and script to test.

>**Note:** For updated information on how to install Pester, look at the
>[Installation](https://github.com/pester/Pester#installation) section.
>To learn more about Pester, look at the
>[Further reading](https://github.com/pester/Pester#further-reading) section.
>Both sections are in the [Pester repository](https://github.com/pester/Pester).

The scripts in these examples are stored in the following structure:

```plaintext
PesterDemo
|-- PesterDemo.psm1
|-- UsingPesterDemo.ps1
|-- test
    |-- PesterDemo.Tests.ps1
    |-- UsingPesterDemo.Tests.ps1
```

### PesterDemo.psm1

The fictitious module we will be testing provides centralized data access functionality to different
data sources. Get-DataFromSource is a function that gets data from the selected source.
Get_DataFromXML is a specialized function that only processes XML. Get_DataFromXML is a private
function, because it is not exported. This means that it is not directly usable and that has an
impact on how we test the module. We will add more later, but we will start with this to further
highlight some of the test design decisions.

```powershell
function Get-DataFromSource
{
    [CmdletBinding()]
    [OutputType([PSObject])]
    Param
    (
        [Parameter( ParameterSetName = 'xml' )]
        [switch] $Xml
    )

    switch ( $PSCmdlet.ParameterSetName )
    {
        'xml' { Get_DataFromXML; return }
    }
}

function Get_DataFromXML
{
    [CmdletBinding()]
    [OutputType([PSObject])]
    Param ( )

    Import-Clixml 'D:\xml\data.xml'
}


Export-ModuleMember -Function *-*
```

### UsingPesterDemo.ps1

Now that we have a module, we need a script that uses it. How we test the module above and the
script below will be a little different, so we have demonstrations of both.

```powershell
Import-Module $PSScriptRoot\PesterDemo.psm1

$data = Get-DataFromSource -Xml
```

## Testing PesterDemo.psm1

If you need more specific guidance on individual Pester commands, please refer to the
[Pester Wiki](https://github.com/pester/Pester/wiki).

### Setting up PesterDemo.tests.ps1

Pester has a function called 'New-Fixture' that will create a template script and associated test
script that you can use to get started. The module test fixture is slightly modified to test a
module vs. a script and work in the folder structure outlined above.

```powershell
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut  = ( Split-Path -Leaf $MyInvocation.MyCommand.Path ) -replace '\.Tests\.psm1', '.ps1'

# Remove any previous module files from the session and add the updated module
Get-Module PesterDemo | Remove-Module
# Import the module from the parent directory
Import-Module "$here\..\$sut"

Describe "PesterDemo" {

    It "does something useful" {
        $true | Should Be $false
    }
}
```

### Adding tests

Let's start by replacing the default test and look at a few tests to see why some tests
might be better than others. We will just start out testing the structure of our function, because
things like a parameter name and type are important if other functions, modules, or scripts are
using it.

```powershell
Describe "PesterDemo" {
    <#
        Get the details of the function under test so we can dig into it. We don't need to worry
        about any errors in Get-Command, since test failures will cascade. This highlights an
        important topic in troubleshooting test code. If the function doesn't exist, all of the
        tests will fail, so make sure you are troubleshooting the right failure in both the test
        and code under test. It seems like common sense, but you will be surprised how a bad test
        name or result can lead you down the wrong path. This is why readability and maintainability
        are so important.
    #>
    $command = Get-Command Get-DataFromSource

    # This test will help flush out unplanned function renames
    It "Has function 'Get-DataFromSource'" {
        $command.Name | Should Be 'Get-DataFromSource'
    }

    <#
        The next 3 tests say they do the same thing in the name, but they do not! This is to
        demonstrate the Trustworthy test point and why it is so important to be as specific as
        possible in your testing. We don't want to develop a false sense of security with tests
        that pass for reasons other than those we expect.
    #>

    # This test passes, but doesn't actually validate the specific parameter exists, only that
    # parameters in general exist
    It 'Has a parameter named xml' {
        $command.Parameters | should be $true
    }

    # This test fails as is to be expected, but it is not failing because the Xml parameter does
    # not exist as its name suggests
    It 'Has a parameter named xml' {
        $command.Parameters | should be 'Xml'
    }

    # This test passes and is the most specific and trustworthy because it is checking the exact
    # property of the exact parameter that we are testing.
    It 'Has a parameter named xml' {
        $command.Parameters.xml.Name | should be 'Xml'
    }
}
```

### Black Box vs. White Box testing

Now that we have a solid test to validate our parameter exists in the correct form, how far we go
with describing the function? The answer is, as usual, it depends. Do you care how the function
works or just that it gives you back PSObjects from the XML? If you only care about getting back a
specific object type or format, then you want black box testing. The parameter name is important to
you, but the fact that the parameter is in ParameterSetName xml is unimportant to you. On the other
hand, what if the parameterset name was important to you? Well then we would be doing white box
testing, because we are describing more how the function internally works. Why is this important?
Consider the following version of 'Get-DataFromSource' where we swap out the switch for an if
statement.

```powershell
function Get-DataFromSource
{
    [CmdletBinding()]
    [OutputType([string])]
    Param
    (
        [Parameter( ParameterSetName = 'xml' )]
        [switch] $Xml
    )

    if ( $Xml )
    {
        Get_DataFromXML
    }
}
```

In this context, the ParameterSetName is not really important anymore, because the condition (if) in
the function is not dependent on it. Now that the function is not dependent on the ParameterSetName,
you might change it. If you were doing white box testing and you changed the name of the
ParameterSet, your test would fail. So the right answer depends on what is important. What happens
when we add more data sources to this function? The ParameterSetName is still less important than
the fact that the ParameterSetNames with different switches are different, so we would want to test
for different ParameterSetNames instead of the ParameterSetNames specifically.

```powershell
function Get-DataFromSource
{
    [CmdletBinding()]
    [OutputType([string])]
    Param
    (
        [Parameter( ParameterSetName = 'xml' )]
        [switch] $Xml,

        [Parameter( ParameterSetName = 'csv' )]
        [switch] $Csv
    )

    if ( $Xml )
    {
        Get_DataFromXml
    }
    elseif ( $Csv )
    {
        Get_DataFromCsv
    }
}
```

But if we go back to the switch statement, the ParameterSetName just became critical to how the
function works.

```powershell
function Get-DataFromSource
{
    [CmdletBinding()]
    [OutputType([string])]
    Param
    (
        [Parameter( ParameterSetName = 'xml' )]
        [switch] $Xml,

        [Parameter( ParameterSetName = 'csv' )]
        [switch] $Csv
    )

    switch ( $PSCmdlet.ParameterSetName )
    {
        'xml' { Get_DataFromXml; continue }
        'csv' { Get_DataFromCsv; continue }
    }
}
```

Why is any of this important beside it tells us that something is broken? Remember that our tests
should be specific and if we have a specific test of the ParameterSetName, then we now know exactly
WHAT is broken.

This is a good time to highlight a potential change in your work pattern. If you are making
changes for several hours and then run your test code, chances are good that you will have multiple
tests fail. Then you will have to figure out what changes you made in the last few hours that caused
the failure(s). The better approach is to make smaller changes, save, and run your test code. If a
test fails, you know right where to go to fix it and then move on. Working this way prevents you
from having to go backwards.

## Isolating functions for Unit testing

Unit testing was described as testing individual components in isolation. In the Get-DataFromSource
function we were calling a private function Get_DataFromXml. If we call Get-DataFromSource in a
test, it will call the private function and if the data source is not available, we get an error.

```powershell
Import-Clixml : Could not find a part of the path 'D:\xml\data.xml'.
At C:\PesterDemo\PesterDemo.psm1:23 char:5
+     Import-Clixml 'D:\xml\data.xml'
+     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : OpenError: (:) [Import-Clixml], DirectoryNotFoundException
    + FullyQualifiedErrorId : FileOpenFailure,Microsoft.PowerShell.Commands.ImportClixmlCommand
```

You could pass fake data to Get_DataFromXml, but that turns our focus away from testing
Get-DataFromSource. Since we are unit testing, we want to isolate and focus on Get-DataFromSource
and nothing else. The mock command can be a little strange when you are starting out with testing
in any language. Mocking is not unique to Pester, but it is a very powerful capability in testing.

### Mock

The Mock command simulates the behavior of an existing command with an alternate implementation
provided in the -MockWith scriptblock. Let's run this test with the Get_DataFromXML function Mocked
and see what happens.

```powershell
Describe 'Get-DataFromSource' {

    It "Calls Get_DataFromXML when the -Xml switch is set" {

        Mock -CommandName Get_DataFromXML -MockWith {}

        Get-DataFromSource -Xml | Should BeNullOrEmpty
    }
}
```

returns

```plaintext
[-] Calls Get_DataFromXML when the -Xml switch is set 25ms
   DirectoryNotFoundException: Could not find a part of the path 'D:\xml\data.xml'.
   at Get_DataFromXML, C:\PesterDemo\PesterDemo.psm1: line 23
   at Get-DataFromSource, C:\PesterDemo\PesterDemo.psm1: line 13
   at <ScriptBlock>, C:\PesterDemo\test\PesterDemo.Tests.ps1: line 53
```

 Hmm, why is Get_DataFromXML still looking for the real data file if we mocked the function?
 Remember scopes? Well this where testing gets fun. Since we imported the module and are testing it
 like it would actually be used, we can see in Get-Module that the private function Get_DataFromXML
 is not visible in our scope, so we can't mock it, or can we?

```powershell
PS C:\PesterDemo> Get-Module PesterDemo

ModuleType Version    Name                                ExportedCommands
---------- -------    ----                                ----------------
Script     0.0        PesterDemo                          Get-DataFromSource
```

The Mock command has an -ModuleScope parameter that allows you to pierce the scope and mock
non-exported objects in the module. So if we add that parameter with the module name, we get the
following output.

```powershell
Describe 'Get-DataFromSource' {

    It "Calls Get_DataFromXML when the -Xml switch is set" {

        Mock -CommandName Get_DataFromXML -MockWith {} -ModuleName PesterDemo

        Get-DataFromSource -Xml | Should BeNullOrEmpty
    }
}
```

returns

```plaintext
Describing Get-DataFromSource
 [+] Calls Get_DataFromXML when the -Xml switch is set 29ms
```

Notice how we don't particularly care at this point what comes back from Get_DataFromXml. We also
want to verify that our private function is being called and not bypassed. Calling a function that
just calls a cmdlet doesn't seem like anything we need to validate, but what if our private function
also logged metrics or something else with business value. Wouldn't it be nice to know that your
functions were being used properly by other functions? Enter the Assert-MockCalled command.

```powershell
Describe 'Get-DataFromSource' {

    It "Calls Get_DataFromXML when the -Xml switch is set" {

        Mock -CommandName Get_DataFromXML -MockWith {} -ModuleName PesterDemo
        Mock -CommandName Import-Clixml -MockWith {}

        Get-DataFromSource -Xml | Should BeNullOrEmpty

        Assert-MockCalled Get_DataFromXML -Times 1 -Exactly -ModuleName PesterDemo
        Assert-MockCalled Import-Clixml -Times 0 -Exactly
    }
}
```

Things are getting a little bit busy, but there is some really specific behavior being validated
here. This might seem to counter the earlier comments about only doing one thing in a test, but if
we read through this we are actually adding more precision to the test result by saying:
* Our function call resulted a call to the expected private Get_DataFromXML function
* Get_DataFromXML was not bypassed by calling the public Import-Clixml cmdlet

This might seem like a lot, but consider the alternative of not testing for this and coming back to
the Get-DataFromSource function in a few weeks or months and having to remember the reason for using
Get_DataFromXml. Without a detailed test, replacing Get_DataFromXML with Import-Clixml might not
break any functionality on the surface, but you would have broken something that may not reveal
itself as a problem for days, weeks, or longer. Then you have to go back and dig through all of the
changes to find and fix a problem in something that isn't technically broken from a user’s
perspective.

Since we are talking about scope, there is another way to look inside the scope of a
module and that is with the InModuleScope command. At first glance it might seem like the same thing,
but instead of selectively choosing when to change scope for a function, InModuleScope wraps an
entire Describe, Context, or It statement and makes everything in that scope available to the test.
This is a very powerful and nice feature to have, but it can give you a false sense of security if
you depend on it too much. As previously mentioned, we are testing the module as it would be
used and exposing all of the private functionality for testing, may create different behavior in
production. So when do you want to use it?

Consider how PowerShell treats the different file types. If we were testing a .ps1 file, then we
simply dot source it in to the session and into the current scope for easy access. We can't dot
source in a psm1 or psd1 file, so we have a couple of options.

1. We could change the module file type to a script for testing and dot source it
   in, then change it back after testing.
1. We could leave the file type as is and import the module, but wrap all of
   private function testing in the InModuleScope command.

Remember the white box testing of our function, this is white box testing the module, because we
want to see and test what is happening. One quick note about the Context command, it is really nice
to be able keep all of these tests and mocks in specific buckets of a Describe and It, but the
Context gives you even more flexibility to compartmentalize your tests. Here is a continuation of
the previous test, but now we want to look closer at the private function Get_DataFromXML.

```powershell
Describe 'Module Functions' {

    Context 'Get-DataFromSource' {

        Mock -CommandName Get_DataFromXML -MockWith {} -ModuleName PesterDemo
        Mock -CommandName Import-Clixml -MockWith {}

        It "Calls Get_DataFromXML when the -Xml switch is set" {

            Get-DataFromSource -Xml | Should BeNullOrEmpty

            Assert-MockCalled Get_DataFromXML -Times 1 -Exactly -ModuleName PesterDemo
            Assert-MockCalled Import-Clixml -Times 0 -Exactly
        }
    }

    Context 'Get_DataFromXML' {

        $command = Get-Command Get_DataFromXML

        It "Get_DataFromXML Exists" {

            $command.Name | Should Be 'Get_DataFromXML'
        }
    }
}
```

returns

```plaintext
Describing Module Functions
   Context Get-DataFromSource
    [+] Calls Get_DataFromXML when the -Xml switch is set 58ms
    Context Get_DataFromXML
Get-Command : The term 'Get_DataFromXML' is not recognized as the name of a cmdlet, function,
script file, or operable program. Check the spelling of the name, or if a path was included,
verify that the path is correct and try again.
```

Two things, first we forgot the InModuelScope, but it was kind of on purpose to help you see when to
mock and when not to. Second, we mocked Get_DataFromXML in the Get-DataFromSource test, but that is
limited to that specific context, so we don't see it anywhere else. We want to mock Get_DataFromXML
when it is a dependency of another function, but we don't want to mock it when we want to actually
test it. So to recap, we mocked Get_DataFromXml using the -ModuleName when it was a dependency, but
when it came time to actually test Get_DataFromXml, we need to pierce the module and test it with
InModuleScope like so.

```powershell
Describe 'Module Functions' {

    Context 'Get-DataFromSource' {

        Mock -CommandName Get_DataFromXML -MockWith {} -ModuleName PesterDemo
        Mock -CommandName Import-Clixml -MockWith {}

        It "Calls Get_DataFromXML when the -Xml switch is set" {

            Get-DataFromSource -Xml | Should BeNullOrEmpty

            Assert-MockCalled Get_DataFromXML -Times 1 -Exactly -ModuleName PesterDemo
            Assert-MockCalled Import-Clixml -Times 0 -Exactly
        }
    }

    InModuleScope PesterDemo {  # Added InModuleScope command

        Context 'Get_DataFromXML' {

            $command = Get-Command Get_DataFromXML

            It "Get_DataFromXML Exists" {

                $command.Name | Should Be 'Get_DataFromXML'
            }
        }
    }
}
```

returns

```plaintext
Describing Module Functions
   Context Get-DataFromSource
    [+] Calls Get_DataFromXML when the -Xml switch is set 58ms
   Context Get_DataFromXML
    [+] Get_DataFromXML Exists 59ms
```

## Testing UsingPesterDemo.ps1

Testing scripts is very similar from a methodology perspective, so everything that has already been
discussed still applies. There are a few subtle difference, but they are mainly how you load and
test the script files themselves. Here is the test file that the New-Fixture command creates. With
a script, no additional modification is necessary and you can see that it is simply dot sourced into
the current scope. Just to reiterate, test your code as it will be used. We spent a lot of time
talking about piercing a module while testing it, but if you are importing a module into a script
then you should not leave your script scope, because the module would be tested in a separate test
file and the script would never be able to access private functions outside of test.

```powershell
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\..\$sut"
```

You can still do interesting things, like mock public functions in the module or built-in cmdlets to
conduct your unit testing, but remember that depending on how your script is written, dot sourcing
in your script may make changes to your system. The changes might be no big deal or a very big deal,
depending on what the script does, so we'll stop there and talk about one final topics.

## Test Driven Development

In this tutorial, we started with a basic module and wrote Pester tests to describe what the
individual components were expected to do. This was using an existing module and it were an
existing script, we would have to figure out what the script was doing and mock everything after the
fact. There is another way to approach testing and that is called Test Driven Development. This
methodology starts a project or change to an existing project by writing the tests first. Since the
tests are written to describe the new functionality first, they should fail. Then you start making
changes to the actual code and running your test code against the changes. This does two things for
you.

1. It verifies that you have added the new functionality without breaking any
   existing functionality in the process.
1. All of the mocks were written first, so theoretically, no changes should occur in unit testing

This is usually a very big change in mindset and probably not where you are going to start, but
we wanted you to be aware of it and consider it when implementing automated testing in your
PowerShell projects. For more detailed information, please see
[https://en.wikipedia.org/wiki/Test-driven_development](https://en.wikipedia.org/wiki/Test-driven_development)
