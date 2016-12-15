# Community Call 12/07/16 Notes

A full recording of this call is available [here](https://youtu.be/ek2L9y8E4FY).  
Feedback for this call can be posted in [issue #233](https://github.com/PowerShell/DscResources/issues/233).

There were two calls, one at 9AM and one at 4PM.
Only the 9AM was attended, so there is only one recording and one set of notes from the 9AM call.

## Call Summary

- [AuditPolicyDsc](#auditpolicydsc)
- [New Maintainers](#new-maintainers)
- [Common Tests](#common-tests)
- [Upcoming Release](#upcoming-release)
- [PSDscResources](#psdscresources)
- [New Module Submission Reviews](#new-module-submission-reviews)
- [Community Topics](#community-topics)

### AuditPolicyDsc

- New module [AuditPolicyDsc](https://github.com/PowerShell/AuditPolicyDsc) for configuring your audit policy subcategories and options.
- Thank you to Adam Haynes for this great new module!

### New Maintainers

- Johan Ljunggren (xSqlServer)
- Daniel Scott-Raynsford (xAdcsDeployment, xCertificate, xNetworking, xStorage)

### Common Tests

- Common tests got a huge update since the last release
- Added extended tests for PS Script Analyzer that just print warnings at the moment. Planning to turn these on around Feb of next year for high quality modules at least.
- New tests have made the common tests much slower. Would love some way to make the PS Script Analyzer tests run faster?
  - Community suggestion: Run each rule individually on each file

### Upcoming Release

- December 14
- 17 modules currently on track to be released:
  - SharePointDsc
  - PSDscResources
  - xActiveDirectory
  - xAdcsDeployment
  - xCertificate
  - xComputerManagement
  - xDatabase
  - xDscDiagnostics
  - xExchange
  - xFailOverCluster
  - xHyper-V
  - xNetworking
  - xPSDesiredStateConfiguration
  - xSCSMA
  - xSQLServer (breaking changes)
  - xStorage
  - xWebAdministration
  
### PSDscResources

- Service and Group have been updated
- ServiceSet and GroupSet will be added
- Working on the other 'Sets'
- Script will be added
- Katie is currently working on Registry
- Mariah is currently working on Process

### New Module Submission Reviews

- We are working through them, but we can only review one at a time. We appreciate your continued patience.
- Current in progress module: SecurityPolicyDsc
- Community ask: Review xWSUS next

### Community Topics

- Need a way to see which issues/PRs are higher priority and where the community members should focus
  - We have since added the `high priority` label to all GitHub repositories as well as a new High Priority column on the waffle board
