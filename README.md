# Khipro Windows Installer

A simple PowerShell installer for [Khipro](https://github.com/KhiproTeam/khipro-windows-portable) on Windows.

This script downloads the [latest portable](https://github.com/KhiproTeam/khipro-windows-portable/releases/latest) `khipro.exe` directly into the current user's Windows Startup folder and starts Khipro immediately.

## Features

* No traditional installation required
* Downloads Khipro directly from the official GitHub release
* Automatically places `khipro.exe` in the Windows Startup folder
* Starts Khipro immediately after installation
* Khipro automatically starts when Windows logs in

## Quick Install

### PowerShell

Open PowerShell and run:

```powershell
irm https://raw.githubusercontent.com/imtiazAR/khipro-winscripts/main/install-khipro.ps1 | iex
```

The script will:

1. Download Khipro.
2. Copy it to the Windows Startup folder.
3. Start Khipro immediately.

### Command Prompt

From CMD, run:

```cmd
powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/imtiazAR/khipro-winscripts/main/install-khipro.ps1 | iex"
```

## Installation Location

Khipro is installed to the current user's Startup folder:

```text
%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\khipro.exe
```

You can open the Startup folder manually with:

```text
shell:startup
```

Press `Win + R`, enter `shell:startup`, and press Enter.

## Uninstall

To remove Khipro from Startup, delete:

```text
%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\khipro.exe
```

Or run:

```powershell
Remove-Item "$([Environment]::GetFolderPath('Startup'))\khipro.exe"
```

## Requirements

* Windows 10 or Windows 11
* PowerShell 5.1 or later
* Internet connection

No administrator privileges are required because the installer uses the current user's Startup folder.

## How It Works

The installer downloads the Khipro portable executable from the GitHub release:

```text
https://github.com/KhiproTeam/khipro-windows-portable/releases/
```

It then saves the executable as:

```text
%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\khipro.exe
```

Because the executable is located in the user's Startup folder, Windows automatically launches it after the user signs in.

## Script

The installer is provided in:

```text
install-khipro.ps1
```

## License

This installer script is provided as-is.

Khipro itself is maintained by the [KhiproTeam project](https://khipro.khiproteam.com/). Please refer to the [Khipro Windows Portable repository](https://github.com/KhiproTeam/khipro-windows-portable) for the Khipro project's license and source code.
