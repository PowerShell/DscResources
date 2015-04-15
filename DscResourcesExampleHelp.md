# File

## Synopsis
A simple File resource

## Syntax
```powershell
File <String>
{
	DestinationPath = <String>
	Ensure = <Ensure> { Present | Absent}
	SourcePath = <String>	
}
```

## Description
This is a File resource that has been reimplemented using PS classes

## Properties
`Path = <String>`
  The destination path that is Ensured to be Present or Absent. Can be a file or a directory.

| Required | Key?  | Default value |
| -------- | ----- | ------------- |
| True     | True  | none          |

`Ensure = <Ensure>`
  Possible values are Present and Absent. 

| Required | Key?  | Default value |
| -------- | ----- | ------------- |
| True     | False | none          |

`SourcePath = <String>`
  The file that must exist (or be absent) at Path. Will copy from this  location if it does not.

| Required | Key?  | Default value |
| -------- | ----- | ------------- |
| True     | False | none          |

## Examples
### Example 1

This describes an example of some Configuration that does something with this resource
```powershell
Configuration {
    Node localhost {
        FileResource myInstance { 
            …
        }
    }
}
```