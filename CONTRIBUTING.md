# Contribute to [PowerShell](https://github.com/powershell) repositories

Hi there! We're thrilled that you'd like to contribute to this project. Your help is essential to keeping it great. 


## Contributing to the existing resources

### Contributing to documentation
One of the easiest way to contribute to a PowerShell project is by helping to write and edit documentation. To [edit an existing file](https://help.github.com/articles/editing-files-in-another-user-s-repository/), simply navigate to it and click the "Edit" button. GitHub will automatically create your own fork of our repository where you can make your changes. Once you're finished, save your edits and submit a pull request to get your changes merged upstream. 

If you want to contribute new documentation, first check for [issues tagged as "Documentation"](TODO) to make sure you're not duplicating efforts. If no one seems to be working on what you have planned, create a fork of our repository and start adding new files to it. Please use [GitHub Flavored Markdown](TODO) to  

## Creating a new resource in an existing module

If you would like to add a DSC resource, first open an issue in the correspongind repository:
- TODO

## Creating you own module with DSC resources
- Use template from [TODO] which provides boilerplate files like [appveyor.yml](appveyor.yml) for CI integration.

## Adding a new module with DSC resources

If you would like to share your DSC resource module or create a brand new module, first [open an issue](TODO) with following information:
- 
1 repository https://github.com/PowerShell/xDSCResources.Tests for common tests:
    - Spaces, no tabs
    - UTF8 encoding for files (git has problems with Unicode)


TODO

## Branches structure

We are using [git flow](http://nvie.com/posts/a-successful-git-branching-model/) model for development.
We recommend that you create local working branches that target a specific scope of change. 
Each branch should be limited to a single feature/bugfix both to streamline work flow and reduce the possibility of merge conflicts.  
![git flow picture](http://nvie.com/img/git-model@2x.png)

## Releasing

TODO
