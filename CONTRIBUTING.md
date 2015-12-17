# Contribute to DscResources repository

Hi there! We're thrilled that you'd like to contribute to this project. Your help is essential to keeping it great. 

## Use GitHub, Git, and this repository

Start by reading our [guide to getting started with GitHub](GettingStartedWithGitHub.md).

## Contributing to existing DSC resources

### Forks and Pull Requests

GitHub fosters collaboration through the notion of [pull requests](https://help.github.com/articles/using-pull-requests/).
On GitHub, anyone can [fork](https://help.github.com/articles/fork-a-repo/) an existing repository into their own branch where they can make private changes to the original repository. 
To contribute these changes back into the original repository, a user simply creates a pull request in order to "request" that the changes be taken "upstream". 

#### Lifecycle of a pull request

* **Always create pull requests to the `dev` branch of a repository**. 
For more information, learn about our [branch structure](#branch-structure).

![Github-PR-dev.png](Images/Github-PR-dev.png)

* Add meaningful title of the PR describing what change you want to check in. Don't simply put: "Fixes issue #5". Better example is: "Added Ensure parameter to xFile resource. Fixes #5". 

* When you create a pull request, fill out the description with a summary of what's included in your changes. 
If the changes are related to an existing GitHub issue, please reference the issue in pull request title or description (e.g. ```Closes #11```). See [this](https://help.github.com/articles/closing-issues-via-commit-messages/) for more details.

* Include update for `README.md` file in your pull request to reflect changes for future versions changelog. Put them in `Unreleased` section (create one if doesn't exist). This would simplify the release process for [Maintainers](Maintainers.md). Example:
    ```
    ## Versions
    
    ### Unreleased
    
    -  Added support for `-FriendlyName` in `Update-xDscResource`.
    ```
    Please use past tense when describing your changes: 
    
      * Instead of "Adding support for Windows Server 2012 R2", write "Added support for Windows Server 2012 R2".
    
      * Instead of "Fix for server connection issue", write "Fixed server connection issue".
    
    Also, if change is related to specific resource, please prefix the description with the resource name:
    
      * Instead of "New parameter 'ConnectionCredential' in xMySqlDatabase resource", write "xMySqlDatabase: added parameter 'ConnectionCredential'"
    
* If this is your first contribution to DscResources, you may be asked to sign a [Contribution Licensing Agreement](https://cla.microsoft.com/) (CLA) before your changes will be accepted.
* After submitting your pull request, our CI system (Appveyor) [will run a suite of tests](#appveyor) and automatically update the status of the pull request.
* After a successful test pass, the module's maintainers will do a code review, commenting on any changes that might need to be made. If you are not designated as a module's maintainer, feel free to review others' Pull Requests as well, additional feedback is always welcome (leave your comments even if everything looks good - simple "Looks good to me" or "LGTM" will suffice, so that we know someone has already taken a look at it)! 
* Once the code review is done, all merge conflicts are resolved, and the Appveyor build status is passing, a maintainer will merge your changes.

### Contributing to documentation
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

All of the articles in this repository use [GitHub Flavored Markdown (GFM)](https://help.github.com/articles/github-flavored-markdown/).

If you are looking for a good editor, try [Markdown Pad](http://markdownpad.com/) or 
GitHub also provides a web interface for Markdown editing with syntax highlighting and the ability to preview changes. 

Some of the more basic GFM syntax includes:

* **Line breaks vs. paragraphs:** In Markdown there is no HTML `<br />` or `<p />` element. 
Instead, a new paragraph is designated by an empty line between two blocks of text.
(Note: Please add a single newline after each sentence to simplify the command-line output of diffs and history.)
It will simplify diffs and history.
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
Links can also have references, which will be discussed in the "Link and Image References" section below.

### Adding test coverage for DSC resources

All DSC modules in the DscResources should have tests written using [Pester](https://github.com/pester/Pester) included in a Tests folder.
It is required that you provide adequate coverage for the code you change.  The following projects have tests which you can use as examples:
* [xDhcpServer](https://github.com/PowerShell/xDhcpServer/tree/master/Tests)
* [xNetwork](https://github.com/PowerShell/xNetworking/tree/dev/Tests) 
* [xSharepoint](https://github.com/PowerShell/xSharePoint/tree/master/Tests/xSharePoint)

One of the most effective ways to report a bug is to provide a Pester test that fails. 
It dramatically simplifies work for the person who will fix it, increases code coverage, and prevents regressions in the future.

We should focus on good unit tests automation before focusing on integration test automation.  Many scenarios require unit testing/mocking to test effectively.  In other words, we should have unit test with good coverage that fail fast, and a few key integration tests that cover important cases.

When it is time to add integration tests, tests should be structured as so:
* One Folder `Tests` in the root of the repo
* If integration tests are presented, I would create sub-folders `Tests\Unit` and `Tests\Integration`. 
* For every resource `xMyAwesomeResource` in the module, I would create a file `Tests\Unit\xMyAwesomeResource.Tests.ps1` with Unit Tests and `Tests\Integration\xMyAwesomeResource.Integration.Tests.ps1`.

### Creating a new DSC resource in an existing module

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


## Contributing a new DSC resource module

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
* If you have used the [Tests.Template folder](Tests.Template) to create your unit and integration tests then the common tests located in [DSCResource.Tests](https://github.com/PowerShell/DscResource.Tests) will be automatically installed for you when your tests are run. 
* If you did not use the [Tests.Template folder](Tests.Template) for your unit and integration testts, run all common tests located in [DSCResource.Tests](https://github.com/PowerShell/DscResource.Tests) 

Follow up in the issue you opened to discuss repo ownership with the PowerShell team.
There are two options:
* Transfer full ownership of your module to the PowerShell organization.
This means we will have full control and permissions to the module repository.
In the future, you will have to fork and submit pull requests to commit changes as if it were any other submodule in [DscResources](https://github.com/PowerShell/DscResources).
![Transfer-Ownership](Images/GitHub-Transfer-Ownership.png)
* Allow the PowerShell organization to fork your repository and use that fork as a submodule of [DscResources](https://github.com/DscResources).
This means that you can continue to operate as you wish on your own branch of the module.
However, you should still submit pull requests to our fork in order to take your changes into the "official" version of the module. 

## AppVeyor

We use [AppVeyor](http://www.appveyor.com/) as a continious integration (CI) system.

In the `README.md` of every DSC resource module repo at the top you can see AppVeyor badge.
It indicates the last build status of master branch.
Hopefuly it's green

![AppVeyor-Badge-Green.png](Images/AppVeyor-Badge-Green.png)

This badge is **clickable**, you can open corresponding build page with logs, artifacts and tests results.
From there you can easily navigate to the whole build history.

AppVeyor builds and runs tests on every pull request and provides quick feedback about it.

![AppVeyor-Github](Images/AppVeyor-Github.png)

These green checkboxes and red crosses are **clickable** as well. 
They will bring you to the corresponding page with details. 

## Common Tests
We have provided a set of common tests for DSC resources in [DSCResource.Tests](https://github.com/PowerShell/DscResource.Tests)
They primarily concentrate on things like code style, encoding, and module version consistency.
The `appveyor.yml` file in each module repository describes the build and test sequence for CI. 
Make sure to run these tests before submitting a pull request. 

[DSCResource.Tests](https://github.com/PowerShell/DscResource.Tests) contains **Fixers** where it's possible.
I.e. you can use [MetaFixers](https://github.com/PowerShell/DscResource.Tests/blob/master/MetaFixers.psm1) to convert all indentations and file encodings.

### Test Templates
We have provided a set of test templates for you to use to create new tests using. There is single file for unit and two for integration tests. These test templates are availabing in the [Tests.Template folder](Tests.Template).

For instructions on how to use these templates, please read the [Tests Guidlines Document](TestsGuidelines.md).

### Run common tests locally
If you have created your tests using the [Tests.Template](Tests.Template) files then the [DSCResource.Tests](https://github.com/PowerShell/DscResource.Tests) will automatically be downloaded into the module folder when the tests are invoked.

If you did not use the [Tests.Template](Tests.Template) to create your tests then you will need to run these common tests on your machine, you should clone [DSCResource.Tests](https://github.com/PowerShell/DscResource.Tests) to resource directory that you want to test.
Then run `Invoke-Pester` from root.

```
git clone https://github.com/PowerShell/DscResource.Tests
Invoke-Pester
```

Avoid adding **DSCResource.Tests** folder to your changes.


## Style guidelines

When contributing to any PowerShell repositories, please follow the following [Style Guidelines](StyleGuidelines.md)

## Branch structure

We are using a [git flow](http://nvie.com/posts/a-successful-git-branching-model/) model for development.
We recommend that you create local working branches that target a specific scope of change. 
Each branch should be limited to a single feature/bugfix both to streamline workflows and reduce the possibility of merge conflicts.
![git flow picture](http://nvie.com/img/git-model@2x.png)
