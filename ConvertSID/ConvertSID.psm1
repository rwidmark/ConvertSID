<#
MIT License

Copyright (C) 2025 Robin Widmark.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
#>
Function Convert-SID {
    <#
        .SYNOPSIS
        Convert SID to plain text

        .DESCRIPTION
        Convert SID to plain readable text

        .PARAMETER SID
        Enter SID to convert, multiple inputs are accepted

        .PARAMETER Trim
        Use this switch if you want to remove the first part of the output to \ sign. Example, it will remove domain\ from domain\username and only output username

        .EXAMPLE
        Convert-MonitorManufacturer -Manufacturer "PHL"
        # Return the translation of the 3 letter code to the full name of the manufacturer, in this example it will return Philips

        .LINK
        https://github.com/rwidmark/ConvertSID/blob/main/README.md

        .NOTES
        Author:         Robin Widmark
        Mail:           robin@widmark.dev
        Website/Blog:   https://widmark.dev
        X:              https://x.com/widmark_robin
        Mastodon:       https://mastodon.social/@rwidmark
		YouTube:		https://www.youtube.com/@rwidmark
        Linkedin:       https://www.linkedin.com/in/rwidmark/
        GitHub:         https://github.com/rwidmark
    #>

    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName, HelpMessage = "Enter SID to convert, multiple inputs are accepted")]
        [ValidateNotNullOrEmpty()]
        [String[]]$SID,
        [Parameter(Mandatory = $False, HelpMessage = "Use this if you want to remove the first part of the output to \ sign. Example, it will remove domain\ from domain\username output")]
        [Switch]$Trim
    )

    foreach ($s in $SID) {
        try {
            $convertSID = New-Object System.Security.Principal.SecurityIdentifier($s)
            $Userobj = $convertSID.Translate([System.Security.Principal.NTAccount])
            if ($Trim -eq $true) {
                $Userobj.Value.Split("\") | Select-Object -Last 1
            }
            else {
                $Userobj.Value
            }
        }
        catch {
            Write-Error -Message "Can't convert SID $s"
            continue
        }
    }
}
