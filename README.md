![GitHub](https://img.shields.io/github/license/rwidmark/ConvertSID?style=plastic)  
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/rwidmark/ConvertSID?sort=semver&style=plastic)  ![Last release](https://img.shields.io/github/release-date/rwidmark/ConvertSID?style=plastic)
![GitHub last commit](https://img.shields.io/github/last-commit/rwidmark/ConvertSID?style=plastic)  
![PSGallery downloads](https://img.shields.io/powershellgallery/dt/ConvertSID?style=plastic)

# ConvertSID
This module will convert SID to plain text so you can read it.
I have added the result from PSScriptAnalyzer in [test folder](https://github.com/rwidmark/ConvertSID/tree/main/test)

# Links
* [My PowerShell Collection](https://github.com/rwidmark/PSCollection)
* [Webpage/Blog](https://widmark.dev)
* [X](https://twitter.com/widmark_robin)
* [Mastodon](https://mastodon.social/@rwidmark)
* [YouTube](https://www.youtube.com/@rwidmark)
* [LinkedIn](https://www.linkedin.com/in/rwidmark/)
* [GitHub](https://github.com/rwidmark)

# Help
Below I have specified things that I think will help people with this module.  
You can also see the API for each function in the [help folder](https://github.com/rwidmark/ConvertSID/tree/main/help)

## Install
Install for current user
```
Install-Module -Name ConvertSID -Scope CurrentUser -Force
```

Install for all users
```
Install-Module -Name ConvertSID -Scope AllUsers -Force
```

## Example
```
Convert-SID -SID "<SID>"
```
If this SID was for an Active Directory user this would return the domain\username of that user, example stolpe.io\rwidmark  
You can also add multiple SIDs at the same time just separate them with a comma, example ```Convert-SID -SID "<SID1>", "<SID2>"```
```
Convert-SID -SID "<SID>" -Trim
```
Sometimes you don't want the domain\ part in return then you can use -Trim switch and it will just return the name after the domain\, example rwidmark

