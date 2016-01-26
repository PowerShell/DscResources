<#
.Synopsis
   DSC Configuration Template for DSC Resource Integration tests.
.DESCRIPTION
   To Use:
     1. Copy to \Tests\Integration\ folder and rename MSFT_<ResourceName>.config.ps1 (e.g. MSFT_xFirewall.config.ps1)
     2. Customize TODO sections.

.NOTES
#>


# TODO: Modify ResourceName
configuration 'MSFT_<ResourceName>_config' {
    Import-DscResource -Name 'MSFT_<ResourceName>'
    node localhost {
       # TODO: Modify ResourceName
       <ResourceName> Integration_Test {
            # TODO: Fill Configuration Code Here
       }
    }
}

# TODO: (Optional): Add More Configuration Templates
