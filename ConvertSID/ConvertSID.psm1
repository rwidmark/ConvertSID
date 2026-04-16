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
        Enter one or more security identifiers (SIDs) to convert.

        .PARAMETER Trim
        Return only the account name portion and omit the domain or computer prefix.

        .EXAMPLE
        Convert-SID -SID 'S-1-5-18'
        Returns the translated account name for the SID.

        .EXAMPLE
        'S-1-5-18' | Convert-SID -Trim
        Returns only the account name portion of the translated SID.

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

    [CmdletBinding(SupportsShouldProcess = $true)]
    Param(
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "Enter one or more security identifiers (SIDs) to convert."
        )]
        [ValidateNotNullOrEmpty()]
        [ValidatePattern('^S-\d-(?:\d+-){1,14}\d+$')]
        [String[]]$SID,
        [Parameter(HelpMessage = "Return only the account name portion and omit the domain or computer prefix.")]
        [Switch]$Trim
    )

    process {
        foreach ($CurrentSID in $SID) {
            if (-not $PSCmdlet.ShouldProcess($CurrentSID, 'Translate SID to account name')) {
                continue
            }

            Write-Verbose "Translating SID '$CurrentSID'."

            try {
                $accountValue = [System.Security.Principal.SecurityIdentifier]::new($CurrentSID).Translate([System.Security.Principal.NTAccount]).Value

                if ($Trim.IsPresent) {
                    # Avoid Split()/Select-Object to keep trimming fast and allocation-light.
                    $separatorIndex = $accountValue.LastIndexOf('\')
                    if ($separatorIndex -ge 0) {
                        $accountValue.Substring($separatorIndex + 1)
                    }
                    else {
                        $accountValue
                    }
                }
                else {
                    $accountValue
                }
            }
            catch {
                $PSCmdlet.WriteError(
                    [System.Management.Automation.ErrorRecord]::new(
                        $_.Exception,
                        'SidTranslationFailed',
                        [System.Management.Automation.ErrorCategory]::InvalidData,
                        $CurrentSID
                    )
                )
            }
        }
    }
}
