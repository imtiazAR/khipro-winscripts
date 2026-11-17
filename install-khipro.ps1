
$DownloadUrl = "https://github.com/KhiproTeam/khipro-windows-portable/releases/download/v1.10/khipro.exe"

$StartupDir = [Environment]::GetFolderPath("Startup")
$KhiproExe = Join-Path $StartupDir "khipro.exe"
$TempExe = Join-Path $env:TEMP "khipro.exe"

try {
    Write-Host "Downloading Khipro..."

    Invoke-WebRequest -Uri $DownloadUrl -OutFile $TempExe -ErrorAction Stop

    if (!(Test-Path $TempExe)) {
        throw "Download failed. File not found."
    }

    # Stop existing Khipro process
    Get-Process -Name "khipro" -ErrorAction SilentlyContinue |
        Stop-Process -Force

    Start-Sleep -Seconds 1

    # Copy to Startup folder
    Copy-Item -Path $TempExe -Destination $KhiproExe -Force -ErrorAction Stop

    Write-Host "Starting Khipro..."
    Start-Process -FilePath $KhiproExe

    Write-Host ""
    Write-Host "Khipro installed successfully!" -ForegroundColor Green
    Write-Host "Location: $KhiproExe"
}
catch {
    Write-Host "Installation failed!" -ForegroundColor Red
    Write-Host $_.Exception.Message
}
finally {
    Remove-Item $TempExe -Force -ErrorAction SilentlyContinue
}

