<#
.SYNOPSIS

Write-DscResourcePowerShellHelp generates PowerShell compatable help files for a DSC
resource module

.DESCRIPTION

The Write-DscResourcePowerShellHelp cmdlet will review all of the MOF based resources
in a specified module directory and will inject PowerShell help files for each resource
in to the specified directory. These help files include details on the property types for
each resource, as well as a text description and examples where they exist.

.PARAMETER OutputPath

Where should the files be saved to (ususally the "en-US" folder inside the module for US english)

.PARAMETER ModulePath

The path to the root of the DSC resource module (where the PSD1 file is found, not the folder for
and individual DSC resource)

.EXAMPLE 

This example shows how to generate help for a specific module

    Write-DscResourcePowerShellHelp -ModulePath C:\repos\SharePointdsc -OutputPath C:\repos\SharePointDsc\en-US

#>
function Write-DscResourcePowerShellHelp
{
    param
    (
        [parameter(Mandatory = $true)] 
        [System.String] 
        $OutputPath,

        [parameter(Mandatory = $true)] 
        [System.String] 
        $ModulePath
    )

    Import-Module (Join-Path -Path $PSScriptRoot -ChildPath "MofHelper.psm1")

    $mofSearchPath = (Join-Path -Path $ModulePath -ChildPath "\**\*.schema.mof")
    $mofSchemas = Get-ChildItem -Path $mofSearchPath -Recurse 
    $mofSchemas | ForEach-Object {
        $mofFileObject = $_ 

        $descriptionPath = Join-Path -Path $_.DirectoryName -ChildPath "readme.md"
        if (Test-Path -Path $descriptionPath)
        {
            $result = (Get-MofSchemaObject -FileName $_.FullName) | Where-Object { 
                ($_.ClassName -eq $mofFileObject.Name.Replace(".schema.mof", "")) `
                    -and ($null -ne $_.FriendlyName)  
            }
            Write-Verbose -Message "Generating help document for $($result.FriendlyName)"

            $output = ".NAME" + [Environment]::NewLine
            $output += "    $($result.FriendlyName)"
            $output += [Environment]::NewLine + [Environment]::NewLine

            $descriptionContent = Get-Content -Path $descriptionPath -Raw
            $descriptionContent = $descriptionContent.Replace("**Description**", ".DESCRIPTION")
            $descriptionContent = $descriptionContent -replace "\n", "`n    "

            $output += $descriptionContent
            $output += [Environment]::NewLine 

            foreach ($property in $result.Attributes) {
                $output += ".PARAMETER $($property.Name)" + [Environment]::NewLine
                $output += "    $($property.State) - $($property.DataType)"
                $output += [Environment]::NewLine
                
                if ([string]::IsNullOrEmpty($property.ValueMap) -ne $true) 
                {
                    $output += "    Allowed values: "
                    $property.ValueMap | ForEach-Object {
                        $output += $_ + ", "
                    }
                    $output = $output.TrimEnd(" ")
                    $output = $output.TrimEnd(",")
                    $output +=  [Environment]::NewLine
                }
                $output += "    " + $property.Description 
                $output += [Environment]::NewLine + [Environment]::NewLine
            }

            $exampleSearchPath = "\Examples\Resources\$($result.FriendlyName)\*.ps1"
            $examplesPath = (Join-Path -Path $ModulePath -ChildPath $exampleSearchPath)
            $exampleFiles = Get-ChildItem -Path $examplesPath

            if ($null -ne $exampleFiles)
            {
                foreach ($exampleFile in $exampleFiles)
                {
                    $exampleContent = Get-Content -Path $exampleFile.FullName -Raw
                    $exampleContent = $exampleContent -replace "<#"
                    $exampleContent = $exampleContent -replace "#>"

                    $output += $exampleContent 
                    $output += [Environment]::NewLine
                }
            }

            $savePath = Join-Path -Path $OutputPath -ChildPath "about_$($result.FriendlyName).help.txt"
            $output | Out-File -FilePath $savePath -Encoding utf8 -Force
        }
    }
}

Export-ModuleMember -Function *
