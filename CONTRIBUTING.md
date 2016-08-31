# Contributing to the Dsc Resource Kit

Welcome to the DSC Resource Kit! We're thrilled that you'd like to contribute! Our community is essential in creating and maintaining all the DSC Resources. 

There are a few different ways you can contribute:

* [Submit an issue](#submitting-an-issue)
* [Fix an issue](#fixing-an-issue)
* [Write documentation](#writing-documentation)
* [Review pull requests](#reviewing-pull-requests) 

If you're just starting out with GitHub, start by reading our [guide to getting started with GitHub](GettingStartedWithGitHub.md).

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Submitting an Issue
Submitting an issue to the DSC Resource Kit is easy!

Here are the steps:

1. Find the correct repository to submit your issue to.
2. Make sure the issue is not open already.
3. Open a new issue.
4. Fill in the issue title.
5. Fill in the issue description.
6. Submit the issue.

### Find the Correct Repository
| Issue Topic | Where to Submit |
|-------------|-----------------|
| <ul><li> DSC Resource Kit overall </li><li> Issues that span multiple resource modules </li><li> DSC Resource Kit processes </li><li> New resource modules </li></ul> | DscResources (this repository!) |
| <ul><li> Common tests </li><li> Meta-fixers </li></ul> | [DscResource.Tests](https://github.com/PowerShell/DscResource.Tests)
| <ul><li> Specific resource </li><li> Resource proposal </li></ul> | The repository of the resource module that contains/should contain the resource. |
| <ul><li> Specific resource module </li></ul> | The repository of that resource module |

You can access a resource module repository with the following URL:
```
https://github.com/PowerShell/<name of resource module>
```
For example, to get to the xCertificate module respository, the URL is:  
```
https://github.com/PowerShell/xCertificate
```

All DSC resource modules are also listed as submodules of this repository under the [xDscResources](xDscResources) and [DscResources](DscResources) folders.

### Open an Issue
Once you are in the correct repository to submit your issue, go to the Issues tab.
![GitHubIssuesTab](Images/GitHubIssuesTab.png)

Ensure that the issue you are about to file is not already open.
If you cannot find an issue that matches the one you are about to file, click the New Issue button on the right.
![GitHubNewIssueButton](Images/GitHubNewIssueButton.png)

A new, blank issue should open up.
![GitHubBlankIssue](Images/GitHubBlankIssue.png)

### Fill in Issue Title
The issue title should be a brief summary of your issue in one sentence.
If it pertains to only one specific resource please prefix the issue title with the resource name followed by a colon.
For example:
![GitHubSpecificResourceIssueTitle](Images/GitHubSpecificResourceIssueTitle.png)

If you would like to submit an issue that would include a breaking change, please also refer to our [Breaking Changes](#breaking-changes) section below.
 
### Fill in Issue Description
The issue description should contain a **detailed** report of the issue you are submitting.
If you are submitting a bug, please include any error messages or stack traces caused by the problem.

Please reference any related issues or pull requests by a pound sign followed by the issue or pull request number (e.g. #11, #72). GitHub will automatically link the number to the corresponding issue or pull request. If GitHub automatically chooses the wrong issue/pull request (e.g. it chooses pull request #18 instead of issue #18) please provide a link to the correct issue/pull request.

Please tag any GitHub users you would like to notice this issue. You can tag someone on GitHub with the @ symbol followed by their username.(e.g. @kwirkykat)

### Submit an Issue
Once you have filled out the issue title and description, click the submit button at the bottom of the issue.
![GitHubIssueSubmitButton](Images/GitHubIssueSubmitButton.png)

## Fixing an Issue
Here's the general process of fixing an issue in the DSC Resource Kit:  
1. Pick out the issue you'd like to work on.  
2. Create a fork of the module that contains the issue.  
3. Clone your fork to your machine.  
4. Create a working branch where you can store your updates to the code.  
5. Make changes in your working branch to solve the issue.  
6. Write tests to ensure that the issue is fixed.  
7. Update the 'Unreleased' section of the module's release notes to include your changes.   
8. Submit a pull request to the dev branch of the official repository for review.  
9. Make sure all tests are passing in AppVeyor for your pull request.  
10. Make sure your code does not contain merge conflicts.  
11. Address any comments brought up by the reviewer. 

### Pick an Issue
Issues that are currently up-for-grabs are tagged with the ```help wanted``` label.
You can see all the issues tagged with ```help wanted``` across all the modules in the DSC Resourece Kit in the Help Wanted column on our [dashboard](https://waffle.io/powershell/dscresources/join).

If you find an issue that you want to work on, but it does not have the ```help wanted``` label, make sure to read through the issue and ask if you can start working on it.

### Fork a Module
In the DSC Resource Kit, a repository and a module are usually the same thing since each repository contains one resource module.

A 'fork' on GitHub is your own personal copy of a repository.
GitHub's guide to forking a respository is available [here](https://help.github.com/articles/fork-a-repo/).
You will need a fork to contribute to any of the repositories in the DSC Resource Kit since only the maintainers have the ability to push to the official repositories.

### Clone your Fork
Once you have created your fork, you can easily access it via the URL: https://github.com/<your GitHub username\>/<module name\>
To clone your your fork to your machine so that you can begin editing


### Create a Working Branch
We are using a [git flow](http://nvie.com/posts/a-successful-git-branching-model/) model for development.
Though you may continue to work and submit pull requests from the default dev branch in your fork, we recommend that you create local working branches that target a specific scope of change. 
Each branch should be limited to a single issue both to streamline the code review and reduce the possibility of merge conflicts.

Your fork is your personal territory. We may set it up however best suits your workflow.

### Make Code Changes
When writing code for any of the modules in the DSC Resource Kit, please follow the DSC Resource Kit [Style Guidelines](StyleGuidelines.md) and [Best Practices](BestPractices.md).
These guidelines are specific to the DSC Resource Kit and may not always reflect the same PowerShell style as other projects.
Code reviewers will expect you to follow these guidelines and may ask you to change your code for consistency.

Once you make a code change, save the file, and commit it to your working branch.
Make sure to push to your working branch to upload your code to the remote working branch of your fork on GitHub, and pay attention to any new code in the official repository.

If you are making a breaking change, please make sure to read the [Breaking Changes section](#breaking-changes) below.

### Write Tests
All DSC modules in the DscResources should have tests written using [Pester](https://github.com/pester/Pester) included in the Tests folder.
You are required to provide adequate test coverage for the code you change.

The tests in the following modules provide excellent examples:  
* [xNetworking](https://github.com/PowerShell/xNetworking/tree/dev/Tests)  
* [xDhcpServer](https://github.com/PowerShell/xDhcpServer/tree/master/Tests)  
* [SharePointDsc](https://github.com/PowerShell/SharePointDsc/tree/master/Tests)  

~We highly encourage you to use [tests templates](https://github.com/PowerShell/DscResources/tree/master/Tests.Template) when creating tests for DSC resources.~  
~Please refer to the [testing guidelines](https://github.com/PowerShell/DscResources/blob/master/TestsGuidelines.md) for information on how to use the templates.~  
These templates are currently in the midst of a huge overall.
Use them with caution as they will be changed soon.

Tests should currently be structured like so:

* Root folder of module  
	* Tests  
		* Unit  
			* MyResource.Tests.ps1  
		* Integrations  
			* MyResource.Integration.Tests.ps1  

Not all resources currently have tests.
This does not mean that you do not have to write tests for your changes.
If you find that the test file for a resource is missing or one the folders in the structure outlines above is missing, please create it.
You don't have to write the full set of tests for the resource if you are creating the file.
You only need to test the changes that you made to the resource.

### Update the Release Notes
Release notes for each module are included in the README.md file under the root folder.
Currently unreleased changes are listed under the 'Unreleased' section under the 'Versions' header.
If this section is missing, please add it.

To update the release notes with your changes, simply add a bullet point (or more) with your changes in the **past** tense under the 'Unreleased' section.  
For example:  
```
    ## Versions
    
    ### Unreleased
    - Added the FriendlyName parameter to Update-xDscResource
```
If a change is related to a specific resource, please add create sub-bullets with your changes under a bullet with the resource name.  
Like so:
```
    ## Versions
    
    ### Unreleased
	- Added the optional FriendlyName parameter to Update-SampleResourceMode
    - xSampleResource
	    - Included support for capitalized names
	    - Fixed error message when negative number is given for durationInMinutes
    - xSampleResource2
	    - Fixed a typo in verbose message 
```

### Submit a Pull Request
[Pull requests](https://help.github.com/articles/using-pull-requests/) allow you to easily submit the changes in your fork to the official repository.


* **Always create pull requests to the `dev` branch of a repository**. 
For more information, learn about our [branch structure](#branch-structure).

![Github-PR-dev.png](Images/Github-PR-dev.png)

* Add meaningful title of the PR describing what change you want to check in. Don't simply put: "Fixes issue #5". Better example is: "Added Ensure parameter to xFile resource. Fixes #5". 

* When you create a pull request, fill out the description with a summary of what's included in your changes. 
If the changes are related to an existing GitHub issue, please reference the issue in pull request title or description (e.g. ```Closes #11```). See [this](https://help.github.com/articles/closing-issues-via-commit-messages/) for more details.


* If this is your first contribution to DscResources, you may be asked to sign a [Contribution Licensing Agreement](https://cla.microsoft.com/) (CLA) before your changes will be accepted.
* After submitting your pull request, our CI system (Appveyor) [will run a suite of tests](#appveyor) and automatically update the status of the pull request.
* After a successful test pass, the module's maintainers will do a code review, commenting on any changes that might need to be made. If you are not designated as a module's maintainer, feel free to review others' Pull Requests as well, additional feedback is always welcome (leave your comments even if everything looks good - simple "Looks good to me" or "LGTM" will suffice, so that we know someone has already taken a look at it)! 
* Once the code review is done, all merge conflicts are resolved, and the Appveyor build status is passing, a maintainer will merge your changes.

### Fix Tests in AppVeyor
The DSC Resource Kit uses [AppVeyor](http://www.appveyor.com/) as a continuous integration (CI) system.

An AppVeyor badge indicating the latest build status of the **master** branch is at the top of the README.md file of every DSC Resource repository.  
![AppVeyor-Badge-Green.png](Images/AppVeyor-Badge-Green.png)

This badge is **clickable**.
It opens the corresponding module's AppVeyor page which shows test logs and results.
From this page you can easily navigate through the build history of the module.

AppVeyor builds and runs tests on every pull request, providing at-a-glance feedback about whether it is passing tests or not.

![AppVeyor-Github](Images/AppVeyor-Github.png)

These green checkboxes and red crosses are **clickable** as well. 
They will bring you to the corresponding test page with details on which tests are running and why your tests may be failing. 

A maintainer **will not** merge your pull request if these tests are failing, even if they have nothing to do with your changes.
If test failures are occurring that do not relate to the changes you made, you will have to submit another PR with fixes or that issue or wait until someone else does.

The appveyor.yml file in each module repository describes the build and test sequence provided to AppVeyor.

#### Common Tests
There is a set of common tests for all DSC Resources located in the [DSCResource.Tests](https://github.com/PowerShell/DscResource.Tests) repository. 
These tests primarily concentrate on code style, file encoding, module version consistency, correct module schema, and PS Script Analyzer issues.

You should run these tests before submitting a pull request. 

The [MetaFixers](https://github.com/PowerShell/DscResource.Tests/blob/master/MetaFixers.psm1) module contains fix-helper methods where possible such as a function to convert all tab indentations to 4 spaces and a function to fix file encodings.

##### Running Common Tests Locally
For some modules, the common DSC Resources tests are automatically downloaded into the module folder when tests are invoked.

If this is not happening for your module, you will need to clone [DSCResource.Tests](https://github.com/PowerShell/DscResource.Tests) into the root folder of the module that you want to test.
Then simply run `Invoke-Pester` from the root folder.

Like this:  
```
cd C:\MyPath\ResourceModuleFolder
git clone https://github.com/PowerShell/DscResource.Tests
Invoke-Pester
```

Please avoid adding the **DSCResource.Tests** folder to your changes.
DSCResource.Tests should be in the .gitignore file so that git will automatically ignore this folder.
If DSCResource.Tests is not in the .gitignore file, please add it.
If there is no .gitignore file for your module, instructions on how to add one are available in the [Getting Started with GitHub](GettingStartedWithGitHub.md) instructions.

### Fix Merge Conflicts
If you have merge conflicts, please use git rebasing to fix them instead of git merging.
An introduction to the correct way to use git rebasing is available in the [Getting Started with GitHub](GettingStartedWithGitHub.md) instructions.

### Get your Code Reviewed
We currently don't have dedicated maintainers for many modules, so it may take a while for a maintainer to get around to reviewing your code.
Our maintainers (other than @kwirkykat and @mbreakey3) are volunteers.
There is no SLA

Anyone other than you can *review* your code.
Only maintainers may *merge* your code.
Module maintainers will make sure that code is reviewed and give it a quick glance-over before merging.

### Forks and Pull Requests

## Breaking Changes
Breaking changes should first be proposed by opening an issue on the resource and outlining the needed work.
This allows the community to discuss the change before the work is done and scopes the breaks to needed areas.

Opening an issue also allows the resource owner or the DSC Resource Kit Owner ([@kwirkykat](https://github.com/kwirkykat)) to tag the issue with the ```breaking change``` label.

Breaking changes may include:

- Adding a new mandatory parameter
- Changing an existing parameter
- Removing an existing parameter
- Fundamentally changing an existing functionality of a resource

Once a PR is ready with the breaking change please include the following:
1. At least one of the bullet points in your addition to the updated release notes starts with 'BREAKING CHANGE:'    
2. The title of the PR that includes your breaking change starts with 'BREAKING CHANGE:'

## Submitting a New Resource

If you would like to add a DSC resource:

* Open an issue in the module repository where you'd like to add a DSC resource to coordinate your work with others.
* Fork the *dev* branch of the module repository you'd like to improve:
    - `git checkout dev`
    - `git checkout -b my_awesome_new_resource`
* In your own forked branch, add and develop your new resources. Make sure you:
    - Write pester tests.
    - Write documentation using GitHub Flavored Markdown 
    - Write (or alter) an example configuration in the Examples subdirectory demonstrating how your resource should be used
    - DO NOT change the *.psd1 ModuleVersion (we will be updating this before releasing to the Gallery)
    - DO NOT change the *.schema.mof ClassVersion. (If this ever needs updating, we will be updating before releasing to the Gallery.)

## Submitting a New Resource Module

If you would like to share your DSC resource module or create a brand new module, first check [existing issues](https://github.com/PowerShell/DscResources/issues): maybe **somebody is already working** on the similar module.
If so, left a comment in the issue, **express your interest** or offer help. Use this issue to **coordinate your efforts**.

If none of the existing issues look related, [open a new issue](https://github.com/PowerShell/DscResources/issues) with the following information:

* What system will your DSC resources be managing?
    - For example, [xActiveDirectory](https://github.com/powershell/xActiveDirectory) models and manages Active Directory
* Will your module include [MOF-based resources](https://technet.microsoft.com/en-us/library/dn956964.aspx) (compatible with PS/WMF 4.0 and 5.0+) or [class-based resources](https://technet.microsoft.com/en-us/library/dn948461.aspx) (only compatible with PS/WMF 5.0+)

Next, develop your DSC resources in your own module repository. Make sure you:

* Write a set of Unit and Integration test cases specific to your resources using Pester using the test templates from the [Tests.Template folder](Tests.Template).
Place them in `Tests\Unit` and `Tests\Integration` directories. ([See details regarding adding tests](https://github.com/PowerShell/DscResources/blob/master/CONTRIBUTING.md#adding-test-coverage-for-dsc-resources))
* Use the template from the [DscResource.Template folder](DscResource.Template) as a boilerplate for [appveyor.yml] (https://github.com/PowerShell/DscResources/blob/master/DscResource.Template/appveyor.yml) (continuous integration configuration file) and [README.md](https://github.com/PowerShell/DscResources/blob/master/DscResource.Template/README.md).
* When you run tests based on the templates the common tests located in [DSCResource.Tests](https://github.com/PowerShell/DscResource.Tests) will be automatically installed into the root folder of your module when your tests are run. 

Once you are ready to submit your new module, follow the submission process [here](NewResourceModuleSubmissions.md).

* Transfer full ownership of your module to the PowerShell organization.
This means we will have full control and permissions to the module repository.
In the future, you will have to fork and submit pull requests to commit changes as if it were any other submodule in [DscResources](https://github.com/PowerShell/DscResources).
![Transfer-Ownership](Images/GitHub-Transfer-Ownership.png)

## Writing Documentation
One of the easiest ways to contribute to a PowerShell project is by helping to write and edit documentation. 
All of our documentation hosted on GitHub is written using [GitHub Flavored Markdown](https://help.github.com/articles/github-flavored-markdown/) in the style of [this example](DscResourcesExampleHelp.md).

To [edit an existing file](https://help.github.com/articles/editing-files-in-another-user-s-repository/), simply navigate to it and click the "Edit" button. 
GitHub will automatically create your own fork of our repository where you can make your changes. 
Once you're finished, save your edits and submit a pull request to get your changes merged upstream. 

If you want to contribute new documentation, first check for [issues tagged as "Documentation"](https://github.com/PowerShell/DscResources/labels/documentation) to make sure you're not duplicating efforts.
If no one seems to be working on what you have planned:

* Open a new issue tagged as "Documentation" to tell others what you're working on
* Create a fork of our repository and start adding new Markdown-based documentation to it
* When you're ready to contribute your documentation, submit a pull request to the *dev* branch

#### GitHub Flavored Markdown (GFM)

All articles in the DSC Resource Kit use [GitHub Flavored Markdown (GFM)](https://help.github.com/articles/github-flavored-markdown/).

If you are looking for a good editor, try the web interface GitHub provides for .md files or [Markdown Pad](http://markdownpad.com/). 

Some of the more basic GFM syntax includes:

* **Line breaks vs. paragraphs:** In Markdown there is no HTML `<br />` or `<p />` element. 
Instead, a new paragraph is designated by an empty line between two blocks of text.
* **Italics:** The HTML `<em>some text</em>` is written as `*some text*`
* **Bold:** The HTML `<strong>some text</strong>` element is written as `**some text**`
* **Headings:** HTML headings are designated using `#` characters at the start of the line. 
The number of `#` characters corresponds to the hierarchical level of the heading (for example, `#` = `<h1>` and `###` = ```<h3>```).
* **Numbered lists:** To make a numbered (ordered) list start the line with `1. `.  
If you want multiple elements within a single list element, format your list as follows:
```        
1.  For the first element (like this one), insert a tab stop after the 1. 

    To include a second element (like this one), insert a line break after the first and align indentations.
```
to get this output:

1.  For the first element (like this one), insert a tab stop after the 1. 

    To include a second element (like this one), insert a line break after the first and align indentations.

* **Bulleted lists:** Bulleted (unordered) lists are almost identical to ordered lists except that the `1. ` is replaced with either `* `, `- `, or `+ `. 
Multiple element lists work the same way as with ordered lists.
* **Links:** The syntax for a hyperlink is `[visible link text](link url)`.
Links can also have reference headers in the same document with the syntax `[visible link text](#my-section-header)`.
The headers cannot have punctuation and all spaces must be replaced by hyphens in the link 'URL'.

## Reviewing Pull Requests
Though only maintainers can *merge* a pull request, anyone from the community may *review* a pull request.
Maintainers will still take a quick look at code before merging it, but reviews by community members often help pull requests get merged much faster as there are very few maintainers and a lot of pull requests to review.
