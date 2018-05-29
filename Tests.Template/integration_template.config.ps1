<#
    .SYNOPSIS
        DSC Configuration Template for DSC Resource Integration tests.

    .DESCRIPTION
        To Use:
            1. Copy to \Tests\Integration\ folder and rename <ResourceName>.config.ps1
               (e.g. MSFT_Firewall.config.ps1).
            2. Customize TODO sections.
            3. Remove TODO comments.
            4. Remove this comment-based help.

    .NOTES
        Comment in HEADER region are standard and should not be altered.
#>

#region HEADER
# Integration Test Config Template Version: 1.1.0
#endregion

<#
    TODO: (Optional) If appropriate this configuration hash table
    can be moved from here and into the integration test file.
    For example if there are several configurations which all
    need different configuration properties, it might be easier
    to have one ConfigurationData-block per configuration test
    then one big ConfigurationData-block here.
    It can also be moved if it is easier to read the tests when
    the ConfigurationData-block is in the integration test file.
    The reason for it being here is that it is easier to read
    the configuration when the ConfigurationData-block is in this
    file.
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

<#
    .SYNOPSIS
        TODO: Add a short but descriptive text what this configuration does.
        (e.g. Enables the port for Remote Desktop Connection.)
#>
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
