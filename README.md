# DSC Resources

Windows PowerShell Desired State Configuration (DSC) provides a configuration platform built into Windows that is based on open standards. 
DSC is flexible enough to function reliably and consistently in each stage of the deployment lifecycle (development, test, pre-production, production), as well as during scale-out, which is required in the cloud world. 

To learn more about Windows PowerShell Desired State Configuration, check out the blog posts on the [PowerShell Blog](http://blogs.msdn.com/b/powershell/) ([this](http://blogs.msdn.com/b/powershell/archive/2013/11/01/configuration-in-a-devops-world-windows-powershell-desired-state-configuration.aspx) is a good starting point).
There are also great community resources, such as [PowerShell.org](http://powershell.org/wp/tag/dsc/), or [PowerShell Magazine](http://www.powershellmagazine.com/tag/dsc/).

If you would like to use DSC on Linux, there is a step by step guide available on the [Building Clouds Blog](http://blogs.technet.com/b/privatecloud/archive/2014/05/19/powershell-dsc-for-linux-step-by-step.aspx) and the source is available in the [Microsoft OpenTech repo](https://github.com/MSFTOSSMgmt/WPSDSCLinux).

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

## Reporting bugs or suggesting features
If you've found a bug in a particular DSC module, or you have a suggestion for how to improve it, submit an issue in the module's repository. 

[Learn more](http://www.joelonsoftware.com/articles/fog0000000029.html) about writing useful bug reports.

## Contributing

See our [contribution guidelines](CONTRIBUTING.md).
