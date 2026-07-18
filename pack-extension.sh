#!/usr/bin/env bash
set -euo pipefail

SRC_DIR="src/v45-46-47-48-49-50"
OUT="pomodoro@lsbcodes.shell-extension.zip"
OUTPUT_PATH="$(pwd)/$OUT"
BUILD_DIR="$(mktemp -d)"
trap 'rm -rf "$BUILD_DIR"' EXIT

cp "$SRC_DIR"/{extension.js,prefs.js,stylesheet.css,metadata.json} "$BUILD_DIR/"
cp -r "$SRC_DIR/schemas" "$BUILD_DIR/schemas"
for po_file in "$SRC_DIR"/po/*.po; do
    language="$(basename "$po_file" .po)"
    mkdir -p "$BUILD_DIR/locale/$language/LC_MESSAGES"
    msgfmt "$po_file" -o "$BUILD_DIR/locale/$language/LC_MESSAGES/pomodoro@lsbcodes.mo"
done
rm -f "$OUT"
(cd "$BUILD_DIR" && zip -r "$OUTPUT_PATH" extension.js prefs.js stylesheet.css metadata.json schemas locale)
echo "Created $OUT"
