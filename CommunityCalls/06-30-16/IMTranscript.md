# Transcript of IM
(Posts without a name are from Katie Keim)

[‎6/‎30/‎2016 1:09 PM] Kendig, Jamie: the blog is better.  
[‎6/‎30/‎2016 1:09 PM] 464276d4-a705-4061-95fa-f7ab83358331@anonymous.invalid: Blog  
[‎6/‎30/‎2016 1:10 PM] Kyle Ruddy: Fan of twitter, but the blog works as well  
[‎6/‎30/‎2016 1:10 PM] Tyson Hayes: What about an issue or something on the resources saying we're getting ready?  
[‎6/‎30/‎2016 1:10 PM] Brian Farnhill: Does using the GitHub "Milestones" feature to put dates on releases help there?  
[‎6/‎30/‎2016 1:11 PM] bcf6c1f9-1386-4e68-9abf-b613c0b10f5c@anonymous.invalid: Blog post and then tweet about it using @powershell_team and personal Twitter accounts   
[‎6/‎30/‎2016 1:11 PM] 36e03e79-967d-46c6-979a-87f9c5d44d81@anonymous.invalid: Thinking if you post to the blog, just tweet a link to the blog entry and I think we will catch it   
[‎6/‎30/‎2016 1:12 PM] Tyson Hayes: @Brian - maybe? I'd be open to trying to use it for my stuff.  
[‎6/‎30/‎2016 1:12 PM] Brian Farnhill: @tyson - Yea we use the milestones to advertise our projected dates for completion of issues etc.  
[‎6/‎30/‎2016 1:13 PM] Narayanan Lakshmanan: milestone is a popular approach, we will look into it. Thanks for suggesting  
[‎6/‎30/‎2016 1:13 PM] Naomi.Reeves: fwiw, I love the milestones  
[‎6/‎30/‎2016 1:16 PM] Adam Haynes: I agree  
[‎6/‎30/‎2016 1:17 PM] Kyle Ruddy: preferred if at all possible, but understand when they don't  
[‎6/‎30/‎2016 1:17 PM] Milestones are great :)  
[‎6/‎30/‎2016 1:18 PM] Travis Plunk: Brian could you add a document on that process to the guidance, or a link to the blog posts?  
[‎6/‎30/‎2016 1:18 PM] Brian Farnhill: https://blogs.msdn.microsoft.com/brian_farnhill/2015/09/27/better-approaches-to-unit-testing-powershell-scripts-that-call-sharepoint-cmdlets/   
[‎6/‎30/‎2016 1:29 PM] Tyson Hayes: CAn someone remind me where we are posting the RFCs again?  
[‎6/‎30/‎2016 1:29 PM] Keith Bankston: One second - will send  
[‎6/‎30/‎2016 1:29 PM] Keith Bankston: Start here: https://github.com/PowerShell/PowerShell-RFC   
[‎6/‎30/‎2016 1:29 PM] Tyson Hayes: Thanks Keith.  
[‎6/‎30/‎2016 1:30 PM] Keith Bankston: The specific RFC I mentioned is here: https://github.com/PowerShell/PowerShell-RFC/blob/master/1-Draft/RFC0004-PowerShell-Module-Versioning.md , although the Issues for that are more germane to this discussion  
[‎6/‎30/‎2016 1:30 PM] Mariah Breakey: https://github.com/PowerShell/DscResources/blob/master/StyleGuidelines.md   
[‎6/‎30/‎2016 1:30 PM] Mariah Breakey: ^style guidelines   
[‎6/‎30/‎2016 1:31 PM] Keith Bankston: There are some good class-based resurce topics in MVA & blogs, would those help?  
[‎6/‎30/‎2016 1:32 PM] For those wondering, my twitter handle is @katiedsc  
[‎6/‎30/‎2016 1:32 PM] Tyson Hayes: You'll want to say it so anyone on the phone knows. :)  
[‎6/‎30/‎2016 1:33 PM] bcf6c1f9-1386-4e68-9abf-b613c0b10f5c@anonymous.invalid: I'm surprised with "Variable Names Use Camel Case" style guide. Is this for DSC resources only?  
[‎6/‎30/‎2016 1:34 PM] Narayanan Lakshmanan: @Aleksandar - most of these apply to PowerShell as a whole  
[‎6/‎30/‎2016 1:35 PM] Stijn Callebaut: can class based resources be fully tested using the available pester tests to pass validation?  
[‎6/‎30/‎2016 1:35 PM] bcf6c1f9-1386-4e68-9abf-b613c0b10f5c@anonymous.invalid: if we look at dir variable: there is no a single variable following Camel Case style  
[‎6/‎30/‎2016 1:36 PM] Keith Bankston: @Aleksandar - PS guidelines specify Pascal casing for all names. Differs from camelCasing by putting CapsUpFront, but otherwise the same.  
[‎6/‎30/‎2016 1:37 PM] These style guidelines are specifically for the ResourceKit. Same question was asked and answered here: https://github.com/PowerShell/DscResources/issues/109   
[‎6/‎30/‎2016 1:37 PM] Stijn Callebaut: yeah, sorry, can't talk :) but all typing  
[‎6/‎30/‎2016 1:37 PM] Keith Bankston: @aleksandar - this is combined with the Verb-NounApproach for commands.  
[‎6/‎30/‎2016 1:37 PM] Stijn Callebaut: i mean the dscresources.tests  
[‎6/‎30/‎2016 1:37 PM] Tyson Hayes: I'll read your questions out loud if you want @stijin.  
[‎6/‎30/‎2016 1:37 PM] Narayanan Lakshmanan: Here is an example of a class based resource with Pester tests https://github.com/nanalakshmanan/nServiceManager   
[‎6/‎30/‎2016 1:38 PM] e0242bf7-2535-d447-8ea5-46687f101f33@anonymous.invalid: yes you can use pester against class based resources, there are a few workarounds to do it  
[‎6/‎30/‎2016 1:39 PM] Stijn Callebaut: @tyson, thanks ;)  
[‎6/‎30/‎2016 1:45 PM] Brian Farnhill: An example of our auto-generated doco - https://github.com/PowerShell/SharePointDsc/wiki/SPCreateFarm   
[‎6/‎30/‎2016 1:45 PM] 4bcd0de8-f5d5-4126-a4c4-9006f4c3c112@anonymous.invalid: Thanks @Brian!  
[‎6/‎30/‎2016 1:49 PM] 4bcd0de8-f5d5-4126-a4c4-9006f4c3c112@anonymous.invalid: Unfortunately I have another meeting I have to attend so can't be here for all agenda items :( . I do have a question I wanted to raise at the end however if someone could possibl
y raise it: What is the status of reviewing the new DSC Resource modules submitted to the DSCResource repo. :)  
[‎6/‎30/‎2016 1:51 PM] Brian Farnhill: I'm working with a team for an Office Web Apps Server resource that should be ready soon as well  
[‎6/‎30/‎2016 1:51 PM] Naomi.Reeves: @Brian yea!  
[‎6/‎30/‎2016 1:51 PM] Rob Plank: +1  
[‎6/‎30/‎2016 2:12 PM] Matthew Hitchcock: I'd love to have this call regularly  
[‎6/‎30/‎2016 2:12 PM] 09e9f15f-32df-470b-859d-a7b553ae9d13@anonymous.invalid: yes  
[‎6/‎30/‎2016 2:12 PM] 36e03e79-967d-46c6-979a-87f9c5d44d81@anonymous.invalid: Yes!    
[‎6/‎30/‎2016 2:12 PM] Matthew Hitchcock: It started at 4am for me so I missed the first hour  
[‎6/‎30/‎2016 2:12 PM] Adam Haynes: e  
[‎6/‎30/‎2016 2:12 PM] Matthew Hitchcock: A downloadable calendar invite would help  
[‎6/‎30/‎2016 2:12 PM] 21ecd470-9795-4369-b9ae-67a8c6ec7675@anonymous.invalid: I think so. It's helpful to hear whats going on in the community  
[‎6/‎30/‎2016 2:13 PM] Matthew Hitchcock: Once per month sounds good  
[‎6/‎30/‎2016 2:13 PM] 36e03e79-967d-46c6-979a-87f9c5d44d81@anonymous.invalid: Once q month seems like a good start   
[‎6/‎30/‎2016 2:13 PM] David Coulter: I'd consider every 6 weeks to align with the Kit release that was talked about earlier.  
[‎6/‎30/‎2016 2:13 PM] 09e9f15f-32df-470b-859d-a7b553ae9d13@anonymous.invalid: though could we get a calendar item so that we dont miss it (by an hour like i did this one)  
[‎6/‎30/‎2016 2:13 PM] Matthew Hitchcock: After would mean we start talking about next release  
[‎6/‎30/‎2016 2:13 PM] Matthew Hitchcock: One before and one after could be good :)  
[‎6/‎30/‎2016 2:15 PM] Stijn Callebaut: i suppose  
[‎6/‎30/‎2016 2:15 PM] Matthew Hitchcock: I'm in Singapore so this started at 4am for me  
[‎6/‎30/‎2016 2:15 PM] 36e03e79-967d-46c6-979a-87f9c5d44d81@anonymous.invalid: In Sweden. This time works but it's late :)  
[‎6/‎30/‎2016 2:15 PM] Stijn Callebaut: Eu  
[‎6/‎30/‎2016 2:15 PM] 09e9f15f-32df-470b-859d-a7b553ae9d13@anonymous.invalid: So in the UK it started at 9pm but I'm happy if it starts at 11pm UK  
[‎6/‎30/‎2016 2:15 PM] Adam Haynes: EU  
[‎6/‎30/‎2016 2:16 PM] 09e9f15f-32df-470b-859d-a7b553ae9d13@anonymous.invalid: I messed up and thought it was kicking off at 10pm  
[‎6/‎30/‎2016 2:16 PM] David Coulter: Aren't most techies up at midnight anyway? :)  
[‎6/‎30/‎2016 2:16 PM] Brian Farnhill: lol  
[‎6/‎30/‎2016 2:17 PM] 09e9f15f-32df-470b-859d-a7b553ae9d13@anonymous.invalid: will the recording be made available so that i could review what i missed  
[‎6/‎30/‎2016 2:17 PM] Matthew Hitchcock: I'll listen to the recording first rather than take everyone back an hour  
[‎6/‎30/‎2016 2:18 PM] 36e03e79-967d-46c6-979a-87f9c5d44d81@anonymous.invalid: Thank you for doing this call! Much appreciated :)  
[‎6/‎30/‎2016 2:18 PM] Matthew Hitchcock: All good, thanks!  
[‎6/‎30/‎2016 2:18 PM] 09e9f15f-32df-470b-859d-a7b553ae9d13@anonymous.invalid: Thank you for this - looking forward to seeing this blossom in future  
[‎6/‎30/‎2016 2:18 PM] Ralph Kyttle: Thanks all!  
[‎6/‎30/‎2016 2:18 PM] Keith Bankston: Thanks everyone! Good job  
[‎6/‎30/‎2016 2:18 PM] David Reynolds: Thanks  
[‎6/‎30/‎2016 2:18 PM] Stijn Callebaut: thanks!  
[‎6/‎30/‎2016 2:18 PM] Rob Plank: Thanks  
[‎6/‎30/‎2016 2:18 PM] 36e03e79-967d-46c6-979a-87f9c5d44d81@anonymous.invalid: Great work everyone!   
[‎6/‎30/‎2016 2:19 PM] 09e9f15f-32df-470b-859d-a7b553ae9d13@anonymous.invalid: @katie - could you dm me on twitter the link for the recording when its available - ryanyates1990  
[‎6/‎30/‎2016 2:19 PM] @ryan yes  
[‎6/‎30/‎2016 2:20 PM] 09e9f15f-32df-470b-859d-a7b553ae9d13@anonymous.invalid: thank you :)  
[‎6/‎30/‎2016 2:20 PM] 09e9f15f-32df-470b-859d-a7b553ae9d13@anonymous.invalid: see you all later  
