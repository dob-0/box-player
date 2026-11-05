#!/bin/sh
# Starts Box Player full screen in Chrome/Chromium. Close with Alt+F4.
D="$(cd "$(dirname "$0")" && pwd)"
B=$(command -v google-chrome || command -v google-chrome-stable || command -v chromium)
exec "$B" --kiosk --user-data-dir="$D/.chrome-profile" --autoplay-policy=no-user-gesture-required "file://$D/box-player.html"
