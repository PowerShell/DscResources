# Community Call 01/18/17 Notes

A full recording of this call is available [here](https://youtu.be/jKBIFVF2a3s).  
Feedback for this call can be posted in [issue #241](https://github.com/PowerShell/DscResources/issues/241).

There were two calls, one at 9AM and one at 4PM.
Only the 9AM was attended, so there is only one recording and one set of notes from the 9AM call.

## Call Summary

- [PSDscResources](#psdscresources)
- [Upcoming Release](#upcoming-release)
- [New Module Submission Reviews](#new-module-submission-reviews)
- [Community Topics](#community-topics)
  
### PSDscResources

- All in-box resources that can be ported to GitHub except Package are now either in progress or in PSDscResources
- Katie is currently working on Archive
- Mariah is currently working on Environment

### Upcoming Release

- January 25
- 7 modules currently on track to be released:
  - PSDscResources
  - xExchange
  - xHyper-V
  - xNetworking
  - xPSDesiredStateConfiguration
  - xSQLServer
  - xWebAdministration

### New Module Submission Reviews

- Current in progress module: SecurityPolicyDsc
- We'll let you know when we are looking at other reviews

### Community Topics

- In regards to the discussion in [this issue](https://github.com/PowerShell/DscResources/issues/237), can we update modules that previously supported WMF 4.0+ to now support only WMf 5.0+?
  - Yes. It will be considered a breaking change. Those who need to use WMF 4.0 can still use the older version, but if they want to use the latest version with all the updates/fixes, they will need to upgrade to a newer WMF.
