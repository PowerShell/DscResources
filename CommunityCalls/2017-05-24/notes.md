# Community Call Notes 5/24/17

11 modules to be released on 05/30/2017:

- PSDscResources
- SecurityPolicyDsc
- SharePointDsc
- xCertificate
- xComputerManagement
- xCredSSP
- xDFS
- xExchange
- xNetworking
- xSqlServer
- xStorage - Breaking


DSC Configurations released - https://github.com/PowerShell/Dscconfigurations
- Feedback is definitely welcome! Please feel free to file issues or  PRs
- We are looking for help on documentation
- We are looking for examples of complete configurations – more than happy to feature them on our community call!
  - Configurations should go into individual's repos, not the PowerShell/DscConfiguration repo



PsDscResources:
- Windows10 creator’s update broke PsDscResources.
  - Does not affect other versions of Windows
  - No workaround. Only option is change resources
  - We have a fix, will go out in Mid-June
- Separate issue: Bug in PsDesiredStateConfiguration (built-in)
  - Archive, Group, Service, WindowsProcess are broken
  - No ETA on fix yet. 

Issues:
 - https://github.com/PowerShell/DscResources/issues/263 discussed and updated per discussion
 - HQRM is still "in the works". We recognize we are totally underwater here. 
   - @zjalexander is going to be driving internal teams to help with mantainence
   - there's a difference between "technical verification" and "high quality", mantainers will start with the first but hopefully hit the second
   - Considering a level between "don't use this in production" and "HQRM" for resources to exist at
   - Using DscConfigurations as a test bed to see if it makes more sense to have new resources exist in individual's repos instead of centrally
     - There are benefits to being in the ResKit, need to look at PSGallery + our automation to see if we can share those  benefits with others
