@echo off
rem Stops Box Player starting at login and gives back normal sleep (screen 10 min, sleep 30 min).
del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\box-player.bat" 2>nul
powercfg /change monitor-timeout-ac 10
powercfg /change standby-timeout-ac 30
echo Box Player autostart removed.
pause
