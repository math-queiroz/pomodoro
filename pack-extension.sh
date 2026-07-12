#!/usr/bin/env bash
set -euo pipefail

SRC_DIR="src/v45-46-47-48-49-50"
OUT="pomodoro@lsbcodes.shell-extension.zip"

rm -f "$OUT"
glib-compile-schemas "$SRC_DIR/schemas"
(cd "$SRC_DIR" && zip -r "../../$OUT" extension.js prefs.js stylesheet.css metadata.json schemas)
echo "Created $OUT"
