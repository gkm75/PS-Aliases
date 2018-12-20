function Get-Head { 
    Param(
        [Parameter(mandatory=$true)] [String]$f,
        [Parameter(mandatory=$false)] [String]$n = "10"
    )
    Get-Content -head $n $f
}

function Get-Tail { 
    Param(
        [Parameter(mandatory=$true)] [String]$f,
        [Parameter(mandatory=$false)] [String]$n = "10"
    )
    Get-Content -tail $n $f
}

function Get-Tail-Wait { 
    Param(
        [Parameter(mandatory=$true)] [String]$f,
        [Parameter(mandatory=$false)] [String]$n = "10"
    )

    Get-Content -tail $n -wait $f
}

function Get-Guid {
    Param(
       $e = ""
    )
    If ($e -ne 'empty') {
        $g = New-Guid 
        $g -split " "
    } Else {
        '00000000-0000-0000-0000-000000000000'
    }
}

function Get-Dump { 
    Param(
        [Parameter(mandatory=$true)] [String]$f
    )
    Format-Hex -Path $f
}

function Get-Hex {
    Param(
        [Parameter(mandatory=$true)] [String]$f
    )
    $content = Get-Content $f -AsByteStream
    ForEach ($b in $content) { 
        Write-Host -Object ("{0:X2}" -f $b) -NoNewLine
    }
}

function Get-Dec {
    Param(
        [Parameter(mandatory=$true)] [String]$f
    )
    $content = Get-Content $f -AsByteStream
    ForEach ($b in $content) { 
        $c = [Convert]::ToString($b,10).PadLeft(3,'0')
        Write-Host -Object ("{0}" -f $c) -NoNewLine
    }
}

function Get-Oct {
    Param(
        [Parameter(mandatory=$true)] [String]$f
    )
    $content = Get-Content $f -AsByteStream
    ForEach ($b in $content) {
        $c = [Convert]::ToString($b,8).PadLeft(3,'0')
        Write-Host -Object ("{0}" -f $c) -NoNewLine
    }
}

function Get-Bin {
    Param(
        [Parameter(mandatory=$true)] [String]$f
    )
    $content = Get-Content $f -AsByteStream
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
    ForEach-Object { 
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
    Get-Content -Path $path -ReadCount ([Convert]::ToInt64($n)) -AsByteStream | 
    ForEach-Object {
        -join [System.Text.Encoding]::ASCII.GetString($_) |
        ForEach-Object { 
            $i++; 
            $c = [Convert]::ToString($i,10).PadLeft(4,'0')
            $_ | Out-File "out_$c.txt"
        }
    }
}

Set-Alias head Get-Head
Set-Alias tail Get-Tail
Set-Alias tailf Get-Tail-Wait
Set-Alias guid Get-Guid
Set-Alias dump Get-Dump
Set-Alias hex  Get-Hex
Set-Alias dec  Get-Dec
Set-Alias oct  Get-Oct
Set-Alias bin  Get-Bin
Set-Alias split Split-Lines
Set-Alias splitb Split-Bytes
