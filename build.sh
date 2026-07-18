#!/usr/bin/env bash
set -euo pipefail

SRC_DIR="src/v45-46-47-48-49-50"
FILES=(extension.js prefs.js stylesheet.css metadata.json)

echo "Building Focus Timer…"
for file in "${FILES[@]}"; do
    cp "$SRC_DIR/$file" ./
done
rm -rf schemas
cp -r "$SRC_DIR/schemas" ./schemas
glib-compile-schemas schemas
rm -rf locale
for po_file in "$SRC_DIR"/po/*.po; do
    language="$(basename "$po_file" .po)"
    mkdir -p "locale/$language/LC_MESSAGES"
    msgfmt "$po_file" -o "locale/$language/LC_MESSAGES/pomodoro@lsbcodes.mo"
done
echo "Build complete."
