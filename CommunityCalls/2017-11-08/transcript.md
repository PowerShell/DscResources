Daniel Scott-Raynsford 12:04 PM: 

Haha

Michael Greene 12:04 PM: 

https://github.com/PowerShell/DscResources/issues/187 

Michael Greene 12:09 PM: 

https://github.com/mgreenegit/DscResources/blob/mgreenegit-patch-1/Naming.md 

Daniel Scott-Raynsford 12:17 PM: 

That makes sense.

Michael Greene 12:18 PM: 

Here's an example where DSC is just a wrapper for functions, in a single module:

https://github.com/torgro/PowerPlan/blob/master/PowerPlan.psm1 

Ljunggren, Johan 12:19 PM: 

To have a module with just DSC resource would be better for review the code to be able to put that into production. That should be named DSC. If they also have other functions not need for DSC then I would think it should not be suffixed with DSC.

Daniel Scott-Raynsford 12:21 PM: 

I'm all for it :)

Michael Greene 12:23 PM: 

Here is the second doc:

https://github.com/mgreenegit/DscResources/blob/mgreenegit-patch-1/Supportability.md 

Ljunggren, Johan 12:32 PM: 

I agree to all that

Daniel Scott-Raynsford 12:32 PM: 

Sounds good to me.

Jason 12:32 PM: 

Hello DSC Gang! A request for something related to naming: the Author property of modules in PSGallery be policed so that official modules from Microsoft be exactly &apos;Microsoft Corporation&apos; with no other variations, e.g., "Find-Module -Tag &apos;DSCResourceKit&apos; | Where { $_.Author -like &apos;*Microsoft*&apos; }" shows some variations, an untagged &apos;*Microsoft*&apos; modules show even more variations. Later, when DSC modules are supported, this naming consistency can become an issue. 

Ljunggren, Johan 12:34 PM: 

I would help in any way I can. 

Daniel Scott-Raynsford 12:35 PM: 

Will definitely continue to work in this direction.

Jason 12:35 PM: 

Could you talk about what is happening with DSC for PowerShell Core 6.0 please? Is Windows PowerShell DSC going to be deprecated after PoSh Core comes out? 

Daniel Scott-Raynsford 12:36 PM: 

Thanks everyone!

Jason 12:36 PM: 

OK, thanks, I know time is short.

Jason 12:36 PM: 

Cool!

Daniel Scott-Raynsford 12:36 PM: 

THank you!

Allan Miller 12:36 PM: 

Thank you.

