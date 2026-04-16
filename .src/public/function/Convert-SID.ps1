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
        Returns NT AUTHORITY\SYSTEM.

        .EXAMPLE
        'S-1-5-18' | Convert-SID -Trim
        Returns SYSTEM.

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
    [OutputType([String])]
    Param(
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "Enter one or more security identifiers (SIDs) to convert."
        )]
        [ValidateNotNullOrEmpty()]
        [ValidatePattern('^S-\d+-\d+(?:-\d+){0,15}$')]
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
                $securityIdentifier = [System.Security.Principal.SecurityIdentifier]::new($CurrentSID)
                $account = $securityIdentifier.Translate([System.Security.Principal.NTAccount])
                $accountValue = $account.Value

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
