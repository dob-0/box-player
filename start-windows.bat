@echo off
rem Starts Box Player full screen. Uses Chrome if installed, else Edge (built into Windows 10/11).
rem Close with Alt+F4.
set "PAGE=file:///%~dp0box-player.html"
set "FLAGS=--kiosk --no-first-run --user-data-dir="%~dp0.browser-profile" --autoplay-policy=no-user-gesture-required"
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe" >nul 2>&1 && (start "" chrome %FLAGS% "%PAGE%" & exit /b)
reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe" >nul 2>&1 && (start "" chrome %FLAGS% "%PAGE%" & exit /b)
start "" msedge %FLAGS% --edge-kiosk-type=fullscreen "%PAGE%"
