#!/bin/sh
# Starts Box Player full screen in Chrome. Close with Cmd+Q.
D="$(cd "$(dirname "$0")" && pwd)"
open -na "Google Chrome" --args --kiosk --user-data-dir="$D/.chrome-profile" --autoplay-policy=no-user-gesture-required "file://$D/box-player.html"
