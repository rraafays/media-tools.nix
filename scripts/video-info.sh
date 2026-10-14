#!/usr/bin/env bash
set -euo pipefail
probe="@ffprobe@"
find . -type f -not -path '*/.*' \( \
  -iname "*.mkv" -o \
  -iname "*.mp4" -o \
  -iname "*.avi" -o \
  -iname "*.mov" -o \
  -iname "*.webm" \
\) -exec "$probe" v:0 {} \;
