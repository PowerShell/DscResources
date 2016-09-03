<#
.SYNOPSIS

Get-MofSchemaObject is used to read a .schema.mof file for a DSC resource 

.DESCRIPTION

The Get-MofSchemaObject method is used to read the text content of the .schema.mof file
that all MOF based DSC resources have. The object that is returned contains all of the 
data in the schema so it can be processed in other scripts.

.PARAMETER FileName 

The full path to the .schema.mof file to process

.EXAMPLE

This example parses a MOF schema file

    $mof = Get-MofSchemaObject -FileName C:\repos\SharePointDsc\DSCRescoures\MSFT_SPSite\MSFT_SPSite.schema.mof

#>
function Get-MofSchemaObject 
{
    param(
        [Parameter(Mandatory=$true)]
        [string]
        $FileName
    )
    $contents = Get-Content $FileName

    $results = @()

    $currentResult = @{
        ClassVersion = $null
        FriendlyName = $null
        ClassName = $null
        Attributes = @()
    }

    $currentComment = ""
    $currentlyInCommentBlock = $false
    foreach($textLine in $contents) 
    {
        if ($textLine.StartsWith("/*")) 
        {
            $currentlyInCommentBlock = $true
        } 
        elseif($textLine.StartsWith("*/")) 
        {
            $currentlyInCommentBlock = $false
        } 
        elseif($currentlyInCommentBlock -eq $true) 
        {
            # Ignore lines in comment blocks
        } 
        elseif ($textLine -match "ClassVersion" -or $textLine -match "FriendlyName") 
        {
            if ($textLine -match "ClassVersion(`"*.`")") 
            {
                $start = $textLine.IndexOf("ClassVersion(`"") + 14
                $end = $textLine.IndexOf("`")", $start)
                $currentResult.ClassVersion = $textLine.Substring($start, $end - $start)
            }

            if ($textLine -match "FriendlyName(`"*.`")") 
            {
                $start = $textLine.IndexOf("FriendlyName(`"") + 14
                $end = $textLine.IndexOf("`")", $start)
                $currentResult.FriendlyName = $textLine.Substring($start, $end - $start)
            }
        } 
        elseif ($textLine -match "class ") 
        {
            $start = $textLine.ToLower().IndexOf("class ") + 6
            $end = $textLine.IndexOf(" ", $start)
            if ($end -eq -1) 
            {
                $end = $textLine.Length
            }
            $currentResult.ClassName = $textLine.Substring($start, $end - $start)
        } 
        elseif ($textLine.Trim() -eq "{" -or [string]::IsNullOrEmpty($textLine.Trim())) 
        {
            # Ignore lines that are only brackets
        } 
        elseif ($textLine.Trim() -eq "};") 
        {
            $results += $currentResult
            $currentResult = @{
                ClassVersion = $null
                FriendlyName = $null
                ClassName = $null
                Attributes = @()
                Documentation = $null
            }
        } 
        else 
        {
            $attributeValue = @{
                State = $null
                EmbeddedInstance = $null
                ValueMap = $null
                DataType = $null
                Name = $null
                Description = $null
                IsArray = $false
            }

            $start = $textLine.IndexOf("[") + 1
            $end = $textLine.IndexOf("]", $start)
            $metadataEnd = $end
            $metadata = $textLine.Substring($start, $end - $start)
            $metadataObjects = $metadata.Split(",")
            $attributeValue.State = $metadataObjects[0]

            $metadataObjects | ForEach-Object {
                if ($_.Trim().StartsWith("EmbeddedInstance")) 
                {
                    $start = $textLine.IndexOf("EmbeddedInstance(`"") + 18
                    $end = $textLine.IndexOf("`")", $start)
                    $attributeValue.EmbeddedInstance = $textLine.Substring($start, $end - $start)
                }
                if ($_.Trim().StartsWith("ValueMap")) 
                {
                    $start = $textLine.IndexOf("ValueMap{") + 9
                    $end = $textLine.IndexOf("}", $start)
                    $valueMap = $textLine.Substring($start, $end - $start)
                    $attributeValue.ValueMap = $valueMap.Replace("`"", "").Split(",")
                }
                if ($_.Trim().StartsWith("Description")) 
                {
                    $start = $textLine.IndexOf("Description(`"") + 13
                    $end = $textLine.IndexOf("`")", $start)
                    $attributeValue.Description = $textLine.Substring($start, $end - $start)
                }
            }
        
            $nonMetadata = $textLine.Replace(";","").Substring($metadataEnd + 1)

            $nonMetadataObjects =  $nonMetadata.Split(" ")
            $attributeValue.DataType = $nonMetadataObjects[1]
            $attributeValue.Name = $nonMetadataObjects[2]

            if ($attributeValue.Name.EndsWith("[]") -eq $true) 
            {
                $attributeValue.Name = $attributeValue.Name.Replace("[]", "")
                $attributeValue.IsArray = $true
            }

            $currentResult.Attributes += $attributeValue
        }
    }
    return $results
}

Export-ModuleMember -Function *
