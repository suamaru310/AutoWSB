Start-Transcript "C:\share\boot.log" -Append

# 日本語化
Set-WinUserLanguageList -Force ja-JP 
Set-WinSystemLocale -SystemLocale ja-JP
Set-WinUILanguageOverride -Language ja-JP
Set-WinHomeLocation 122

# ファイル名の拡張子を表示する
Set-ItemProperty -LiteralPath "HKCU:Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Value "0" -Force

# wingetのインストール
$progressPreference = 'silentlyContinue'
Write-Information "Downloading WinGet and its dependencies..."
Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile Microsoft.VCLibs.x64.14.00.Desktop.appx
Invoke-WebRequest -Uri https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x64.appx -OutFile Microsoft.UI.Xaml.2.8.x64.appx
Add-AppxPackage Microsoft.VCLibs.x64.14.00.Desktop.appx
Add-AppxPackage Microsoft.UI.Xaml.2.8.x64.appx
Add-AppxPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle

# 任意のアプリをインストール

## 7-zipのインストール
winget install -e --id 7zip.7zip --accept-source-agreements --accept-package-agreements

## Chromeのインストール
winget install --id Google.Chrome --force --accept-source-agreements --accept-package-agreements

# 任意のアプリをインストール ここまで

Stop-Transcript

# システムを再起動
Restart-Computer                          
