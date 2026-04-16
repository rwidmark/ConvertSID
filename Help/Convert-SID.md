
NAME
    Convert-SID
    
SYNOPSIS
    Convert SID to plain text
    
    
SYNTAX
    Convert-SID [-SID] <String[]> [-Trim] [-WhatIf] [-Confirm] [<CommonParameters>]
    
    
DESCRIPTION
    Convert SID to plain readable text
    

PARAMETERS
    -SID <String[]>
        Enter one or more security identifiers (SIDs) to convert.
        
        Required?                    true
        Position?                    0
        Default value                
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false
        
    -Trim [<SwitchParameter>]
        Return only the account name portion and omit the domain or computer prefix.
        
        Required?                    false
        Position?                    named
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
NOTES
    
        Author:         Robin Widmark
        Mail:           robin@widmark.dev
        Website/Blog:   https://widmark.dev
        X:              https://x.com/widmark_robin
        Mastodon:       https://mastodon.social/@rwidmark
		YouTube:		https://www.youtube.com/@rwidmark
        Linkedin:       https://www.linkedin.com/in/rwidmark/
        GitHub:         https://github.com/rwidmark
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Convert-SID -SID 'S-1-5-18'
    Returns the translated account name for the SID.
    
    
    -------------------------- EXAMPLE 2 --------------------------
    
    PS > 'S-1-5-18' | Convert-SID -Trim
    Returns only the account name portion of the translated SID.
    
    
    
    
    
    
    
RELATED LINKS
    https://github.com/rwidmark/ConvertSID/blob/main/README.md

