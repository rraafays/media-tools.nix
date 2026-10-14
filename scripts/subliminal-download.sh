#!/usr/bin/env bash
set -euo pipefail
lang="${1:?usage: subliminal-download <language>}"
subliminal="@subliminal@"
find . -type f -not -path '*/.*' \( \
  -iname "*.mkv" -o \
  -iname "*.mp4" -o \
  -iname "*.avi" -o \
  -iname "*.mov" -o \
  -iname "*.webm" \
\) -exec "$subliminal" download -l "$lang" {} \;
