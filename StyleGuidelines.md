# DSC Resource Style Guidelines

General Rules
----------------

 1. For all indentation, use 4 spaces instead of tab stops
 2. Make sure all files are encoding using UTF-8. 
 3. Windows handles [newlines](http://en.wikipedia.org/wiki/Newline) using CR+LF instead of just CR. 
For interoperability reasons, we recommend that you follow [these instructions](GettingStartedWithGitHub.md#setup-git) when installing Git on Windows so that newlines saved to GitHub are simply CRs. 
 4. When writing Markdown, if a paragraph includes more than one setence, end each sentence with a newline.
GitHub will still render the sentences as a single paragraph, but the readability of `git diff` will be greatly improved. 
 5. Files must end with a newline, see [StackOverflow.](http://stackoverflow.com/questions/5813311/no-newline-at-end-of-file) 

PowerShell Coding Style Guidelines
==================================

Code should not contain multiple blank lines in a row
---------------------------------------------------

    Function Get-MyValue
    {
        Write-Verbose 'Getting MyValue'
    
    
        return $MyValue
    }

The above code breaks this rule by having two new lines between the write-verbose and the return.

Opening curly brackets should not be followed by a blank line
-------------------------------------------------------------

    Function Get-MyValue
    {

        Write-Verbose 'Getting MyValue'
    
        return $MyValue
    }

The code above breaks this rule by leaving a blank line after the opening curly brackets.