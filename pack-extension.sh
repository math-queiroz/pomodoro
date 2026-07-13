#!/usr/bin/env bash
set -euo pipefail

SRC_DIR="src/v45-46-47-48-49-50"
OUT="pomodoro@lsbcodes.shell-extension.zip"

rm -f "$OUT"
(cd "$SRC_DIR" && zip "../../$OUT" extension.js prefs.js stylesheet.css metadata.json schemas/*.xml)
echo "Created $OUT"
