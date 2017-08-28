# Community Call 03/01/17 Notes

A full recording of this call is available [here](https://youtu.be/QVsuNzFZAPo).  
Feedback for this call can be posted in [issue #251](https://github.com/PowerShell/DscResources/issues/251).

There was only one call Today at 9AM (PST) which is what we plan to do moving forward since this time seems to be the most popular for people.
If this does not work for you and you are interested in joining at another time, please feel free to provide us feedback at the link listed above.

## Call Summary

- [SecurityPolicyDsc](#securitypolicydsc)
- [Upcoming Release](#upcoming-release)
- [PSDscResources](#psdscresources)
- [Code Coverage Report](#code-coverage-report)
- [Configuration Sharing](#configuration-sharing)
- [Integration Testing](#integration-testing)
- [Class Based Resources](#class-based-resources)

### SecurityPolicyDsc

- Brand new module submission from Jason Walker
- Check out this resource [here](https://github.com/PowerShell/SecurityPolicyDsc)

### Upcoming Release

- March 8
- 6 modules currently on track to be released:
  - PSDscResources
  - xExchange
  - xPSDesiredStateConfiguration
  - xRemoteDesktopSessionHost
  - xSQLServer
  - xWindowsUpdate
  
### PSDscResources

- All in-box resources that can be ported to GitHub except Package are now in PSDscResources
- Environment was released just after our main release last month
- Archive has just been added as a High Quality Resource and will be released next week
- Package is in the process of being upgraded
  - We will be splitting this resource into 2 resources: One for EXE files and one for MSI files
  - We will be keeping xPackage in xPSDesiredStateConfiguration and the in-box Package in PSDesiredStateConfiguration as is for the time being so as to not cause any breaking changes
  - We encourage everyone to upgrade to the new package modules once they are released
  - PSDscResources will only have the two new resources

### Code Coverage Report

- We have recently added a new Code Coverage Report that can be attached to Resource modules
- It gives a general overview of the code coverage for the entire module as well as individual code coverage reports for each pull request
- We have attached this new feature to a few modules already including PSDscResources and are in the process of adding it to more resource modules

### Configuration Sharing

- We are in the process of finalizing a new repo on GitHub for DSC Configurations
- Once this goes live we encourage you to submit your own configurations so that we can share them with the community
- Any feedback on how to handle testing/organization/etc. for this repo will be gladly accepted

## Community Topics

### Integration Testing

- Integration testing is difficult/impossible through AppVeyor for many of our resource modules
- Even if the tests can't be run through AppVeyor, we still encourage people to include integration tests
- If you do run into problems running any of the modules that you downloaded from the gallery, please submit an issue in the module's repo on GitHub

### Class Based Resources

- We encourage community members to submit new class-based resources if they would like
- We currently have guidelines and documentation for writing class-based resources but we don't have a definitive example
- We don't have any plans to upgrade most of our current modules to class-based, mainly because we want to provide backwards compatibility with WMF 4.0

