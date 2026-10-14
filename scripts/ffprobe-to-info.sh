#!/usr/bin/env bash
set -euo pipefail
stream="$1"
file="$2"
info_file="${file%.*}-info.txt"
@ffprobeBin@ \
  -v error \
  -select_streams "$stream" \
  -show_entries "stream=codec_name,width,height,pix_fmt,r_frame_rate,bit_rate,sample_rate,channels,channel_layout,sample_fmt" \
  -show_entries "format=duration,size,bit_rate" \
  -of default=noprint_wrappers=1 \
  "$file" >"$info_file"
