@echo off
rem Makes Box Player start by itself when this user logs in. Undo: uninstall-autostart-windows.bat
set "STARTUP=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
(
  echo @echo off
  echo rem Box Player autostart - wait 15 s for the projector, sound and USB to be ready
  echo timeout /t 15 /nobreak ^>nul
  echo call "%~dp0start-windows.bat"
) > "%STARTUP%\box-player.bat"
rem Keep the screen and computer awake while plugged in (0 = never)
powercfg /change monitor-timeout-ac 0
powercfg /change standby-timeout-ac 0
echo Box Player will start at every login.  File: "%STARTUP%\box-player.bat"
pause
