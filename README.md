# DSC Resources

[![Join the chat at https://gitter.im/PowerShell/DscResources](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/PowerShell/DscResources?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Windows PowerShell Desired State Configuration (DSC) provides a configuration platform built into Windows that is based on open standards. 
DSC is flexible enough to function reliably and consistently in each stage of the deployment lifecycle (development, test, pre-production, production), as well as during scale-out, which is required in the cloud world. 

To learn more about Windows PowerShell Desired State Configuration, check out the blog posts on the [PowerShell Blog](http://blogs.msdn.com/b/powershell/) ([this](http://blogs.msdn.com/b/powershell/archive/2013/11/01/configuration-in-a-devops-world-windows-powershell-desired-state-configuration.aspx) is a good starting point).
There are also great community resources, such as [PowerShell.org](http://powershell.org/wp/tag/dsc/), or [PowerShell Magazine](http://www.powershellmagazine.com/tag/dsc/).

If you would like to use DSC on Linux, there is a step by step guide available on the [Building Clouds Blog](http://blogs.technet.com/b/privatecloud/archive/2014/05/19/powershell-dsc-for-linux-step-by-step.aspx) and the source is available in the [Microsoft OpenTech repo](https://github.com/MSFTOSSMgmt/WPSDSCLinux).

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Repository structure
This is the central repository for PowerShell Desired State Configuration (DSC) resources.
DSC resources are packaged in PowerShell modules, along with tests, documentation, and examples, each in their own GitHub repositories. 
These repositories are included as [submodules](http://git-scm.com/docs/git-submodule) of the [DscResources](https://github.com/powershell/DscResources) repository you're currently browsing. 

You can clone this repository to download the source for all DSC resource modules 

```
git clone --recursive https://github.com/PowerShell/DscResources.git
```

Or just download the respository's structure and documentation
```
git clone https://github.com/PowerShell/DscResources.git
```

## Production releases

To see a list of all released DSC Resource Kit modules, go to the [PowerShell Gallery](https://www.powershellgallery.com/) and display [all modules tagged as DSCResourceKit](https://www.powershellgallery.com/packages?q=Tags%3A%22DSCResourceKit%22). You can also type a module’s name in the search box on the upper right side of the PowerShell Gallery to find a specific module.

Another way is to go directly to a specific module by typing it’s URL:

http://www.powershellgallery.com/packages/MODULE_NAME

e.g.:

[http://www.powershellgallery.com/packages/xWebAdministration](http://www.powershellgallery.com/packages/xWebAdministration)

Of course, you can always use PowerShellGet (available in [WMF 5.0](http://go.microsoft.com/fwlink/?LinkID=398175)) as well:

```
Find-DscResource
```

## Development builds

Nuget feeds with development builds (created every time we merge PR/push commit) are available for all our modules under:

https://ci.appveyor.com/nuget/MODULE_NAME

e.g.:

[https://ci.appveyor.com/nuget/xpsdesiredstateconfiguration](https://ci.appveyor.com/nuget/xpsdesiredstateconfiguration)


To use it, first register new PSRepository using PowerShellGet:

```
Register-PSRepository -Name <Repository_Name> -SourceLocation https://ci.appveyor.com/nuget/<Module_Name>
```
e.g.
```
Register-PSRepository -Name xExchangeDev -SourceLocation https://ci.appveyor.com/nuget/xexchange
```

Use Find-Module to list available versions of the module:

```
Find-Module -Repository <Repository_Name>
```
e.g.
```
Find-Module -Repository xExchangeDev
```

To install latest development version, use the following command:
```
Install-Module -Name <Module_Name> -Repository <Repository_Name>
```
e.g.
```
Install-Module -Name xExchange -Repository xExchangeDev
```
 
You can also install specific version of the module by adding –RequiredVersion parameter:
```
Install-Module -Name <Module_Name> -Repository <Repository_Name> -RequiredVersion <Version_Number>
```
e.g.
```
Install-Module -Name xExchange -Repository xExchangeDev -RequiredVersion 1.2.0.48
```

## Reporting bugs or suggesting features

If you've found a bug in a particular DSC module, or you have a suggestion for how to improve it, submit an issue in the module's repository. 

[Learn more](http://www.joelonsoftware.com/articles/fog0000000029.html) about writing useful bug reports.

## Contributing

See our [contribution guidelines](CONTRIBUTING.md).

## Maintaining

See our [guidelines for DSC resource maintainers](Maintainers.md).

## Dashboard

You can see dashboard of all open issues and pull requests across DSC Resource here: [![Stories in Ready](https://badge.waffle.io/powershell/dscresources.png?label=ready&title=Ready)](https://waffle.io/powershell/dscresources) 
