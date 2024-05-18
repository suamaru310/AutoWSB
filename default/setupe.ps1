#

$SharePath = 'C:\Share'

$IsExistPath = Test-Path $SharePath
If (!$IsExistPath) {
    New-Item -Path "C:\" -Name "Share" -ItemType "directory"
}

Copy-Item ./share/boot.ps1 $SharePath


