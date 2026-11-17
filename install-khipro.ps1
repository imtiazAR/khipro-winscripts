$DownloadUrl = "https://github.com/KhiproTeam/khipro-windows-portable/releases/download/v1.10/khipro.exe"

$StartupDir = [Environment]::GetFolderPath("Startup")
$KhiproExe = Join-Path $StartupDir "khipro.exe"

# Download directly to Startup folder
Write-Host "Downloading Khipro..."
Invoke-WebRequest -Uri $DownloadUrl -OutFile $KhiproExe

# Run Khipro
Write-Host "Starting Khipro..."
Start-Process -FilePath $KhiproExe

Write-Host ""
Write-Host "Khipro installed successfully!"
Write-Host "Location: $KhiproExe"
