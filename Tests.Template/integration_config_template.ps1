<#
.Synopsis
   DSC Configuration Template for DSC Resource Integration tests.
.DESCRIPTION
   To Use:
     1. Copy to \Tests\Integration\ folder and rename <ResourceName>.config.ps1 (e.g. MSFT_Firewall.config.ps1)
     2. Customize TODO sections.

.NOTES
#>

# Integration Test Config Template Version: 1.0.1

# TODO: Modify ResourceName (e.g. MSFT_Firewall_config)
configuration <ResourceName>_config {
    # TODO: Modify ModuleName (e.g. NetworkingDsc)
    Import-DscResource -ModuleName '<ModuleName>'
    node localhost {
        # TODO: Modify ResourceFriendlyName (e.g. Firewall_Integration_Test)
        <ResourceFriendlyName> Integration_Test {
            # TODO: Fill Configuration Code Here
        }
    }
}

# TODO: (Optional): Add More Configuration Templates
