
NAME
    Convert-SID
    
SYNOPSIS
    Convert SID to plain text
    
    
SYNTAX
    Convert-SID [-SID] <String[]> [-Trim] [<CommonParameters>]
    
    
DESCRIPTION
    Convert SID to plain readable text
    

PARAMETERS
    -SID <String[]>
        Enter SID to convert, multiple inputs are accepted
        
        Required?                    true
        Position?                    1
        Default value                
        Accept pipeline input?       true (ByPropertyName)
        Accept wildcard characters?  false
        
    -Trim [<SwitchParameter>]
        Use this switch if you want to remove the first part of the output to \ sign. Example, it will remove domain\ from domain\username and only output username
        
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
    
    PS > Convert-MonitorManufacturer -Manufacturer "PHL"
    # Return the translation of the 3 letter code to the full name of the manufacturer, in this example it will return Philips
    
    
    
    
    
    
    
RELATED LINKS
    https://github.com/rwidmark/ConvertSID/blob/main/README.md


