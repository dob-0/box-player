# Box Player
Lid opens → a random clip (video + its track) plays on the projector and speaker. Lid closes → stop, black screen.

## Parts
- `box_sensor/box_sensor.ino` — Arduino Uno sketch. HC-SR04: Vcc→5V, Gnd→GND, Trig→9, Echo→10. Sends OPEN / CLOSED over USB.
- `box-player.html` — the player (Chrome or Edge, no install). `clips.js` — the list of video + track pairs.
- `clips/` — your files (the three coloured test clips can be deleted).
- `start-windows.bat`, `start-mac.command`, `start-linux.sh` — start the player full screen.

## Steps on the show computer
1. Install the Arduino IDE, open `box_sensor/box_sensor.ino`, choose board "Arduino Uno" and its port, press Upload.
2. Serial Monitor (9600): note the `cm` value with the lid closed and with it open; set `OPEN_CM` between them, upload again. Close the Serial Monitor.
3. Put your files in `clips/` and list each pair in `clips.js`.
4. Set the projector as the main display and the speaker as the sound output.
5. Run the start script. First time only: press S, click "Connect sensor", pick the Arduino port. After that it connects by itself.
6. Start at boot (Windows): double-click `install-autostart-windows.bat` once. It also keeps the screen and PC awake on mains power. Undo: `uninstall-autostart-windows.bat`.
   For a show PC with no login screen: Windows Settings > Accounts > Sign-in options (or `netplwiz`) to sign in automatically.
7. Keys: S panel, O / C test open / close without the sensor. Close: Alt+F4 (Mac: Cmd+Q).
