@echo off
echo ViraXis © 2025 All rights reserved.
:: Check for administrator rights
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrator privileges...
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

echo Restoring Ctrl+Alt+Del menu options...

:: ---- Current User Policies ----
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableCAD       /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr  /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableLockWorkstation /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableChangePassword  /f >nul 2>&1

:: ---- Local Machine Policies ----
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableCAD       /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr  /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableLockWorkstation /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableChangePassword  /f >nul 2>&1

echo Done. Ctrl+Alt+Del options have been restored.
echo Please log off and log on again or reboot for all changes to take effect.
pause