#!/usr/bin/env bash
set -euo pipefail

UUID="pomodoro@lsbcodes"
DEST="$HOME/.local/share/gnome-shell/extensions/$UUID"
gnome-extensions disable "$UUID" 2>/dev/null || true
rm -rf "$DEST"
echo "Focus Timer has been removed. Log out and back in to finish."
