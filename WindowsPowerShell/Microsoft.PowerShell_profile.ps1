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

function Cmd-Dump { 
    Param(
        [Parameter(mandatory=$true)] [String]$f
    )
    Format-Hex -Path $f
}

function Cmd-Hex {
    Param(
        [Parameter(mandatory=$true)] [String]$f
    )
    $content = Get-Content $f -Encoding Byte
    ForEach ($b in $content) { 
        Write-Host -Object ("{0:X2}" -f $b) -NoNewLine
    }
}

function Cmd-Dec {
    Param(
        [Parameter(mandatory=$true)] [String]$f
    )
    $content = Get-Content $f -Encoding Byte
    ForEach ($b in $content) { 
        $c = [Convert]::ToString($b,10).PadLeft(3,'0')
        Write-Host -Object ("{0}" -f $c) -NoNewLine
    }
}

function Cmd-Oct {
    Param(
        [Parameter(mandatory=$true)] [String]$f
    )
    $content = Get-Content $f -Encoding Byte
    ForEach ($b in $content) {
        $c = [Convert]::ToString($b,8).PadLeft(3,'0')
        Write-Host -Object ("{0}" -f $c) -NoNewLine
    }
}

function Cmd-Bin {
    Param(
        [Parameter(mandatory=$true)] [String]$f
    )
    $content = Get-Content $f -Encoding Byte
    ForEach ($b in $content) {
        $c = [Convert]::ToString($b,2).PadLeft(8,'0')
        Write-Host -Object ("{0}" -f $c) -NoNewLine
    }
}

function Split-Lines {
    Param(
        [Parameter(mandatory=$true)] [String]$path,
        [Parameter(mandatory=$false)] [String]$n = "100"
    )
    $i=0;
    Get-Content -Path $path -ReadCount $n | 
    ForEach { 
        $i++; 
        $c = [Convert]::ToString($i,10).PadLeft(4,'0')
        $_ | Out-File "out_$c.txt"
    }
}

function Split-Bytes {
    Param(
        [Parameter(mandatory=$true)] [String]$path,
        [Parameter(mandatory=$false)] [String]$n = "1024"
    )
    $i=0;
    Get-Content -Path $path -ReadCount ([Convert]::ToInt64($n)) -Encoding Byte | 
    ForEach {
        -join [System.Text.Encoding]::ASCII.GetString($_) |
        ForEach { 
            $i++; 
            $c = [Convert]::ToString($i,10).PadLeft(4,'0')
            $_ | Out-File "out_$c.txt"
        }
    }
}

Set-Alias head Cmd-Head
Set-Alias tail Cmd-Tail
Set-Alias tailf Cmd-Tail-Wait
Set-Alias guid Cmd-Guid
Set-Alias dump Cmd-Dump
Set-Alias hex  Cmd-Hex
Set-Alias dec  Cmd-Dec
Set-Alias oct  Cmd-Oct
Set-Alias bin  Cmd-Bin
Set-Alias split Split-Lines
Set-Alias splitb Split-Bytes
