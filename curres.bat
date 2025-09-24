@echo off
echo ViraXis © 2025 All rights reserved.
:: Проверка прав администратора
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ask for admin rights
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

echo In progress...

:: Сброс пользовательских указателей мыши (HKCU)
reg delete "HKCU\Control Panel\Cursors" /v "Arrow" /f
reg delete "HKCU\Control Panel\Cursors" /v "Help" /f
reg delete "HKCU\Control Panel\Cursors" /v "AppStarting" /f
reg delete "HKCU\Control Panel\Cursors" /v "Wait" /f
reg delete "HKCU\Control Panel\Cursors" /v "Crosshair" /f
reg delete "HKCU\Control Panel\Cursors" /v "IBeam" /f
reg delete "HKCU\Control Panel\Cursors" /v "NWPen" /f
reg delete "HKCU\Control Panel\Cursors" /v "No" /f
reg delete "HKCU\Control Panel\Cursors" /v "SizeNS" /f
reg delete "HKCU\Control Panel\Cursors" /v "SizeWE" /f
reg delete "HKCU\Control Panel\Cursors" /v "SizeNWSE" /f
reg delete "HKCU\Control Panel\Cursors" /v "SizeNESW" /f
reg delete "HKCU\Control Panel\Cursors" /v "SizeAll" /f
reg delete "HKCU\Control Panel\Cursors" /v "UpArrow" /f
reg delete "HKCU\Control Panel\Cursors" /v "Hand" /f

:: Установка схемы курсоров по умолчанию
reg add "HKCU\Control Panel\Cursors" /v "CursorScheme" /t REG_SZ /d "" /f

echo Congratulations! Cursors will be reset. Please restart your PC.
pause