# FooDscModule

A synopsis of the system that FooDscModule is modeling or the purpose for which FooDscModule is used. 

## Contributing
Please check out common DSC Resources [contributing guidelines](https://github.com/PowerShell/DscResource.Kit/blob/master/CONTRIBUTING.md).

## Resources

* **FooResource1** performs some function Bar
* **FooResource2** performs some other function Baz

## FooResource1

* **Name**: The name of FooResource1
* **Option**: This property has a fixed set of values: {Value1 | Value2 }

## FooResource2

* **FooResource2Prop1**: A property for FooResource2
* **Ensure**: Ensures that FooResource 2 is **Present** or **Absent**

## Versions

### Unreleased

* Any update, new feature, or bugfix that has not been put into the latest Gallery-published of the module.

### 1.1.0.0

* A minor fix to FooResource1 that fixes some bug
* Added the FooResource2 resource

### 1.0.0.0

* The initial release of FooDscModule with the following resources:
  - FooResource1

## Examples
### Example 1

This describes an example of some Configuration that does something with this resource module

```powershell
Configuration {
    Import-DscResource -ModuleName FooDscModule
    Node localhost {
        FooResource1 myInstance { 
            …
        }
    }
}
```