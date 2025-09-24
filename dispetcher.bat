@echo off
echo ViraXis © 2025 All rights reserved.
:: Check for administrator rights
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Running with administrator privileges...
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

echo Restoring access to Task Manager...

:: Delete registry key that disables Task Manager for current user
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableTaskMgr" /f

:: Delete registry key that disables Task Manager for all users
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableTaskMgr" /f

echo Access to Task Manager has been restored.
pause