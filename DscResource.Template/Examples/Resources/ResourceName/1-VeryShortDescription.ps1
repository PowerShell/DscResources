<#
.EXAMPLE
    This example shows how to ...
#>

Configuration Example
{
    Import-DscResource -ModuleName <ResourceModule>

    Node $AllNodes.NodeName
    {
        ResourceName ShortNameForResource
        {
            Ensure                = 'Present'
            MandatoryParameter    = 'MyValue'
            NonMandatoryParameter = 'OtherValue'
        }
    }
