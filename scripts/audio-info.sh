#!/usr/bin/env bash
set -euo pipefail
probe="@ffprobe@"
find . -type f -not -path '*/.*' \( \
  -iname "*.mp3" -o \
  -iname "*.flac" -o \
  -iname "*.wav" -o \
  -iname "*.m4a" -o \
  -iname "*.aac" -o \
  -iname "*.ogg" -o \
  -iname "*.opus" -o \
  -iname "*.wma" \
\) -exec "$probe" a:0 {} \;
