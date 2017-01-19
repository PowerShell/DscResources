# DSC Resources

[![Join the chat at https://gitter.im/PowerShell/DscResources](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/PowerShell/DscResources?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

This is the central repository for the DSC Resource Kit, a collection of DSC resources maintained and released by Microsoft.

A dashboard of all open issues and pull requests across DSC Resource Kit is available [here](http://waffle.io/powershell/dscresources).

Please note, all resources with the 'x' prefix in their names (e.g. xResource) are still experimental – this means that those resources are provided AS IS and are not supported through any Microsoft support program or service. If you find a problem with a resource, please [file an issue](https://github.com/PowerShell/DscResources/blob/master/CONTRIBUTING.md#submitting-an-issue) here on GitHub.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## New to PowerShell DSC

Desired State Configuration (DSC) is a declarative management platform in PowerShell to configure, deploy, and manage systems.
If you are new to DSC, configurations, or resources, you can learn more about them [here](https://msdn.microsoft.com/en-us/powershell/dsc/overview).

## Resource Module Source Code

The DSC Resource Kit currently contains more than 55 different resource modules.

You can find the source code of a resource module by visiting its GitHub page at:  
https://github.com/PowerShell/< module name >   
For example, for the xCertificate module, go to:  
https://github.com/PowerShell/xCertificate. 

All DSC resource modules are also listed as submodules of this repository (DscResources) in the [xDscResources folder](https://github.com/PowerShell/DscResources/tree/master/xDscResources) (unsupported) or [DscResources folder](https://github.com/PowerShell/DscResources/tree/master/DscResources) (supported). 

To download the released source code for **all** DSC resource modules, clone this repository with this git command:

```
git clone https://github.com/PowerShell/DscResources.git --recursive
```

Alternatively, to download just the documentation provided in this repository, clone this repository with this git command:
```
git clone https://github.com/PowerShell/DscResources.git
```

## Released DSC Resource Modules

To see a list of **all** released DSC Resource Kit modules, go to the [PowerShell Gallery](http://www.powershellgallery.com/) and display [all modules tagged as DSCResourceKit](http://www.powershellgallery.com/packages?q=Tags%3A%22DSCResourceKit%22).

To find a **specific** module, enter the module's name in the search box in the upper right corner of the PowerShell Gallery or go directly to its URL:  
http://www.powershellgallery.com/packages/< module name >  
For example:   
http://www.powershellgallery.com/packages/xWebAdministration 

We recommend that you use PowerShellGet to install DSC resource modules:
```powershell
Install-Module -Name < module name >   
```
For example:
```powershell
Install-Module -Name xWebAdministration
```
 
To update all previously installed modules at once, open an elevated PowerShell prompt and use this command: 
```powershell
Update-Module 
```

After installing modules, you can discover all DSC resources available to your local system with this command: 
```powershell
Get-DscResource 
```

## Contributing to the Resource Modules

You are more than welcome to contribute to the development of the DSC Resource Kit. There are several different ways you can help. You can create new DSC resources or modules, add test automation, improve documentation, fix existing issues, or open new ones.
See our [contributing guide](https://github.com/PowerShell/DscResources/blob/master/CONTRIBUTING.md) for more info on how to become a DSC Resource Kit contributor.

## Resource Module Maintainers

To see a list of the maintainers for each resource modules as well as the instructions for maintaining a module, see our [guidelines for DSC resource maintainers](Maintainers.md).

## Questions, Comments, Concerns?

If you're looking into using PowerShell DSC, have questions or issues with a current resource, or would like a new resource, let us know on Twitter ([@PowerShell_Team](https://twitter.com/PowerShell_Team)) or by creating an issue on [GitHub](https://github.com/powershell/dscresources/issues).

The PowerShell team also hosts DSC Resource Kit community calls to give updates, collect feedback, and answer questions. Find the date of the next call in our [community agenda](CommunityAgenda.md).
