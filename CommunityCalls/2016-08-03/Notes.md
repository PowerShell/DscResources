# Community Call 08/03/16 Notes 
A full recording of this call is available [here](https://youtu.be/4tXPJyDqA2E).

Feedback for this call can be posted in [issue #168](https://github.com/PowerShell/DscResources/issues/168).

## Call Summary
[Release Cadence](#release-cadence)  
[New Module Submission Process](#new-module-submission-process)  
[First Timer Label](#first-timer-label)  
[Suggestions from Last Call in the Pipeline](#suggestions-from-last-call-in-the-pipeline)  
[Nano Server Resource Implementations](#nano-server-resource-implementations)  
[Upcoming Release](#upcoming-release)  
[High Quality Web Administration Partial Release](#high-quality-web-administration-partial-release)  
[Modules with Blockers](#modules-with-blockers)  
[Release Process](#release-process)  
[Current Goals](#current-goals)  
[Questions from Community](#questions-from-community)  

### Release Cadence
- 6 weeks between releases seems to be a good timeframe, so we will continue

### New Module Submission Process
- New process posted [here](https://github.com/PowerShell/DscResources/blob/master/NewResourceModuleSubmissions.md)
- 7-8 new modules submissions currently open for review (Thank you!)
- Any other suggestions for review tools we could use with GitHub?

### First Timer Label
- ```easy-fix``` label in xPSDSC successful, will add to other repositories to help first-timers contribute
- Issues should be opened for even tiny fixes needed

### Suggestions from Last Call in the Pipeline
- Documentation for beginners/new contributors (especially around starting out with Pester)
- Moving documentation to the GitHub wiki structure
- Automatic style fixing script
 
### Nano Server Resource Implementations
- If you're going to implement a nano-server version of a resource, implement it within the resource instead of creating a separate resource for Nano server
- DSC Resource Kit does not have regular tests set up for Nano Server
 
### Upcoming Release
- August 10th
- 9-10 modules currently on track to be released:
    - SharePointDsc
    - xActiveDirectory
    - xDhcpServer
    - xHyper-V
    - xNetworking
    - xPSDSC
    - xSqlServer
    - xSqlPs
    - xWebAdministration
    - Partial WebAdministrationDsc

### High Quality Web Administration Partial Release
- Partial module release only
- Releasing so we can gather feedback and test quality
- Continuing with the high quality plan in the meantime
 
### Modules with Blockers
- The following modules all have at least one blocking issue that will prevent them from releasing:
    - xAzure
    - xAzurePack
    - xJea
    - xMySql
    - xRemoteDesktopAdmin
    - xSafeHarbor
    - xSCDPM
    - xSCSMA
    - xSCSR
    - xSCOM
    - xSCSR
    - xSCOM
    - xSCSPF
    - xSCVMM
    - xWebDeploy
    - xWordPress
 
### Release Process
- Script that shows all the PRs that have been merged into dev branches since last release
- If a module that has merged PRs that would affect someone using the module from PS Gallery (changes to appveyor.yml, README, etc. will not be released on their own)
- Check that tests are all passing on the dev branch (Non-passing modules not released)
- Bump up the version number of the module (usually the second number, unless a breaking change)
- Transfer release notes to manifest so that they will post on PS Gallery
- Open and merge PR from dev to master
- Use git tag to create a save of the latest commit where we are releasing from
- Push to PS Gallery
- SharePointDsc does not work this way because Brian is amazing creates a release branch
    - Would like other modules to work this way but don't have enough maintainers

### Current Goals
- Improve documentation and processes
- Increase the number of resources
- Increase the rate of contribution
 
### Questions from Community
- Are class-based resources being excluded?
    - No, just no one has submitted any yet
    - If a new resource module requires WMF 5 (can't run on 4), that's fine
- Can we find a way to tally up interest in new modules/resources so that we know which ones are worth it?
    - Yes
    - Can currently post a module/resource proposal as an issue, could present a tally of +1's for opened issues
