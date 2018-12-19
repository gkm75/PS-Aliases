function Cmd-Head { 
    Param(
        [Parameter(mandatory=$true)] [String]$f,
        [Parameter(mandatory=$false)] [String]$n = "10"
    )
    Get-Content -head $n $f
}

function Cmd-Tail { 
    Param(
        [Parameter(mandatory=$true)] [String]$f,
        [Parameter(mandatory=$false)] [String]$n = "10"
    )
    Get-Content -tail $n $f
}

function Cmd-Tail-Wait { 
    Param(
        [Parameter(mandatory=$true)] [String]$f,
        [Parameter(mandatory=$false)] [String]$n = "10"
    )

    Get-Content -tail $n -wait $f
}

function Cmd-Guid {
    Param(
       $e = ""
    )
    If ($e -ne 'empty') {
        New-Guid
    }
    Else {
	Write-Output 'Guid'
	Write-Output '----'
        '00000000-0000-0000-0000-000000000000'
    }
}

Set-Alias head Cmd-Head
Set-Alias tail Cmd-Tail
Set-Alias tailf Cmd-Tail-Wait
Set-Alias guid Cmd-Guid
