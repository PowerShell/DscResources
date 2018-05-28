<#
.Synopsis
   DSC Configuration Template for DSC Resource Integration tests.
.DESCRIPTION
   To Use:
     1. Copy to \Tests\Integration\ folder and rename <ResourceName>.config.ps1 (e.g. MSFT_Firewall.config.ps1).
     2. Customize TODO sections.

.NOTES
#>

# Integration Test Config Template Version: 1.0.2

<#
    TODO: (Optional) This configuration hash table can be moved
    from here and into the integration test file as appropriate.
#>
$ConfigurationData = @{
    AllNodes = @(
        @{
            NodeName                    = 'localhost'
            PSDscAllowPlainTextPassword = $true

            # TODO: (Optional) Add configuration properties.
        }
    )
}

# TODO: Modify ResourceName (e.g. MSFT_Firewall_EnableRemoteDesktopConnection_Config).
Configuration MSFT_<ResourceName>_<ShortDescriptiveName>_Config {
    # TODO: Modify ModuleName (e.g. NetworkingDsc)
    Import-DscResource -ModuleName '<ModuleName>'

    node localhost
    {
        # TODO: Modify ResourceFriendlyName (e.g. Firewall).
        <ResourceFriendlyName> Integration_Test {
            # TODO: Add resource parameters here.
        }
    }
}

# TODO: (Optional) Add More Configuration Templates.
