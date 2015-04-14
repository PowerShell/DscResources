# Contribute to [PowerShell](https://github.com/powershell) repositories

Hi there! We're thrilled that you'd like to contribute to this project. Your help is essential to keeping it great. 


## Contributing to existing resources

### Contributing to documentation
One of the easiest way to contribute to a PowerShell project is by helping to write and edit documentation. To [edit an existing file](https://help.github.com/articles/editing-files-in-another-user-s-repository/), simply navigate to it and click the "Edit" button. GitHub will automatically create your own fork of our repository where you can make your changes. Once you're finished, save your edits and submit a pull request to get your changes merged upstream. 

If you want to contribute new documentation, first check for [issues tagged as "Documentation"](https://github.com/PowerShell/DscResources/labels/documentation) to make sure you're not duplicating efforts. If no one seems to be working on what you have planned, create a fork of our repository and start adding new files to it. Please use [GitHub Flavored Markdown](https://help.github.com/articles/github-flavored-markdown/) to write your 

### Creating a new resource in an existing module

If you would like to add a DSC resource:
* [Open an issue tagged as "TODO"](TODO) in the module repository where you'd like to add a DSC resource
* Fork the *development* branch of the module repository you'd like to improve
* In your own forked branch, add and develop your new resources. Make sure you:
    - TODO: Write tests using Pester
    - TODO: Write documentation using GitHub Flavored Markdown 
    - Write (or alter) an example configuration demonstrating how your resource should be used
    - DO NOT change the *.psd1 ModuleVersion (we will be updating this before releasing to the Gallery)
    - TODO: Something with appveyor?
    - TODO: Follow our style guidelines


## Contributing a new DSC resource module

If you would like to share your DSC resource module or create a brand new module, first [open an issue](TODO) with following information:

Use template from [TODO] which provides boilerplate files like [appveyor.yml](appveyor.yml) for CI integration.

* What system will your DSC resources be managing?
    - For example, [xActiveDirectory](https://github.com/powershell/xActiveDirectory) models and manages Active Directory
* Will your module include [MOF-based resources](TODO) (compatible with PS/WMF 4.0 and 5.0+) or [class-based resources](TODO) (only compatible with PS/WMF 5.0+)

Next, develop your resources in your own module repository. Make sure you:

* Follow our style guidelines (TODO)
* Write a set of test cases specific to your resources using [Pester](TODO). Place them in a Tests directory (TODO?)
* Run all common tests located in [xDSCResources.Tests](https://github.com/PowerShell/xDSCResources.Tests)

TODO: What actually happens at the end here? Does ownership of the module and repository transfer to us? Or they just submit a pull request for us to add it as a submodule to DscResources? Or do we fork it and become the new de-facto for that module, including it as part of DscResources and having people submit new code to us? 


## Style guidelines

TODO: Could use some guidance here about encoding, text editors, setting up Git properly on Windows with CR+LF -> CR, etc. 

When contributing to any PowerShell repositories, please follow the following guidelines: 

* For all indentation, use 4 spaces instead of tab stops
* Make sure all files are encoding using UTF-8. 

## Branches structure

We are using [git flow](http://nvie.com/posts/a-successful-git-branching-model/) model for development.
We recommend that you create local working branches that target a specific scope of change. 
Each branch should be limited to a single feature/bugfix both to streamline work flow and reduce the possibility of merge conflicts.  
![git flow picture](http://nvie.com/img/git-model@2x.png)

## Releasing

TODO
