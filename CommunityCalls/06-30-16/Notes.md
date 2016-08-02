# Community Call 06/30/16 Notes 
A full recording of this call is available [here](https://www.youtube.com/watch?v=3G47tiJfaaE).

## Call Summary
[Release Cadence](#release-cadence)  
[High Quality Resource Modules](#high-quality-resource-modules)  
[Style Guidelines](#style-guidelines)  
[Class-Based Resources](#class-based-resources)  
[Dependencies in Resource Examples](#dependencies-in-resource-examples)  
[Best Practices](#best-practices)  
[How to Help Module Maintainers](#how-to-help-module-maintainers)  
[New Resources Wanted](#new-resources-wanted)  
[How to Help Contributors](#how-to-help-contributors)  
[Overall Improvements Wanted](#overall-improvements-wanted)  
[Community Calls](#community-calls)  

### Release Cadence
* Currently happens when there has been significant contribution (lots of merged pull requests, closed issues, new resources)
* Recently about 6 weeks apart
* Want a set release date and lots of warning beforehand
* Posts of release date will be on twitter and on main DSC Resource Kit repo
* Want release of individual resources
* Can release individual resources for hotfixes on a case by case basis now
* Not everyone sees the blog or Twitter, watches repo or PSGallery

### High Quality Resource Modules
* Most of the high quality qualifications are going to take place in SharepointDsc in future releases 
* Everything that has been laid out in current plans makes sense -- those resources should meet those standards 
* Style matters in the sense that coming in to read the code should make sense 
* Mocking for unit testing allows identifications of problems before integration testing 
* Unit testing is necessary for production as a criteria in order to trust the resource 
* When building a configuration, want to know that we have a good build of everything that it's dependent on it 
* Code coverage is important, coverage depends on the complexity of resource, but Pester's calculations aren't always accurate 
* If unit tests aren't passing, changes will not be shipped 
* Putting time into those tests will greatly increase the quality for users 
* Unit tests help with PSGallery's reputation as well 
* Most like the new SharepointDSC naming style, think it's easy 
* Use standards from command-naming to name the modules, Pascal casing to identify new word beginning, biggest concept leads followed by next concept, etc. 
* If your module contains only DSC resources, then use '<resourceName>Dsc' naming convention
* If there is a module that contains something other than DSC, then don't add the DSC to the end 

### Style Guidelines
* We updated our style guidelines last week, everyone should take a look at these guidelines
* Parameter placement has changed 

### Class-Based Resources
* Many benefits of going to class-based model -- why aren't we doing that yet? 
* Sharepoint wants to provide support for WMF 4, so didn’t do the class-based model 
* xWebAdmin also wants to support WMF 4, certain resources will have to draw their own line in the sand about what they need/want to support 
* Backwards compatibility also important in xPSDSC 
* Can class-based resources be tested with Pester? 
* Test DSC resource doesn't work on class-based resources 
* Ask to put something in the Test DSC resource that will handle when a call tries to test a class-based resource -- certain work arounds are necessary 

### Dependencies in Resource Examples
* Do resource examples need to be able to work without dependencies out of the box? 
* Do we want our resources to be self-contained, are we okay with pulling from other resources? 
* We want some examples that are out of the box, and some that could pull
* SharePoint examples are going to be redone in next release 
* SharePoint plan: for each resource, add a couple of examples for that resource and scenarios for how they can be used 

### Resource Documentation
* Documentation done by SharePoint is very helpful and should be an example for other resources 
* SharePoint Dynamically reads mof files to pull examples and generate wiki files 
* SharePoint wants to get away from putting this info in the mof files, but still want to continue with the wiki file structure 

### Best Practices
* What are some best practices for DSC resources you would like to see in our new Best Practices document? 
* Use Write-Verbose and Write-Debug liberally 

### How to Help Module Maintainers
* Module maintainers -- what would you like to see from DSC Resource Kit team? 
* How are we handling bringing in new resources, how can we do that better? 
* Going through a transition, but new resources that has been submitted is being reviewed now 
* Will create a procedure for new resources, which should help with adding new ones

### New Resources Wanted
* Any new resources that are really wanted? 
* Seeing resources for security settings, audit settings from the os perspective 
* MSecurity is pushed out through group policy right now, but not through dsc  
* Seeing resources approved/signed by Microsoft would go a long way in helping with this, especially with customers 
* We are working on security, are there any resources regarding client settings that people are interested in? 
* Some looking away from DSC for this because they don't want to interrupt client operations 

### How to Help Contributors
* What can we do to help people contribute to the resource kit?
* Label the first-timer bugs -- things for first-timers to get involved in 
* Guidelines for how to help with documentation
* Better guidance on writing/running the unit tests on pester
* Getting some videos/documentation/info from pester on how to do this best 
* Can add an example for writing a first test 
* Testing is difficult to learn, there are no tutorials 
* Can add contributor stories
* PRs are stalled in the review process 
* Can add tutorials on reviewing pull requests, AppVeyor 

### Overall Improvements Wanted
* Scripting to autofix style guidelines more than what already exists

### Community Calls
* Useful to have regular community calls
* Once a month is good
* Some feedback about pros and cons to having call before vs after release

