# Powershell Aliases / Profile

## Install

These aliases can be put in the user profile script that is loaded upon the startup of powershell. In Microsoft Windows you can put the script in "MyDocuments\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
where as in Linux they can be put into "~/.config/powershell/Microsoft.PowerShell_profile.ps1".

Note that if powershell is already started, these can be parsed by the command ".$Profile".

There are two scripts in the WindowsPowerShell folder;

* Microsoft.PowerShell_profile.ps1 for *powershell*
* Microsoft.PowerShell_profile.Core.ps1 for *powershell core*

## Aliases

This is a list of aliases available in the script files

### head

head *file* [n]

Displays the first n lines of the file. The default number of lines is 10 if it is not passed as parameter.

### tail

tail *file* [n]

Displays the last n lines of the file. The default number of lines is 10 if it is not passed as parameter.

### tailf

tailf *file* [n]

Displays the last n lines of the file and waits/prints the next lines if the file is updated. This is ideal for log files for instance. The default number of lines is 10 if it is not passed as parameter.

### guid

guid [empty]

This creates a new Guid. If "empty" is specified then the empty (all zeros) Guid is displayed.

### dump

dump *file*

Displays a hexadecimal file dump.

### hex

hex *file*

Displays a continuous string of the hexadecimal values of the files` bytes.

### dec

dec *file*

Displays a continuous string of the decimal values of the files` bytes. Every value takes 3 digits and is padded with a 0 if necessary.

### oct

oct *file*

Displays a continuous string of the octal values of the files` bytes. Every value takes 3 digits and is padded with a 0 if necessary.

### bin

bin *file*

Displays a continuous string of the binary values of the files` bytes. Every value takes 8 digits and is padded with a 0 if necessary.

### split

split *file* [n]

Splits the file in chunks each having [n] lines. If the number of lines is not specified then it defaults to 100. The output files are named out_nnnn.txt where nnnn is the consecutive sequence number. 

### splitb

splitb *file* [n]

Splits the file in chunks each having [n] bytes. If the number of bytes is not specified then it defaults to 1024. The output files are named out_nnnn.txt where nnnn is the consecutive sequence number.
