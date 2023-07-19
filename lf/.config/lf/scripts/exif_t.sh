#!/bin/bash

ext="$(printf '%s\n' "$1" | tr '[:upper:]' '[:lower:]' | rev | cut -d. -f1 | rev)"

case "$ext" in
  bmp|gif|jpg|jpeg|jfif|jpe|png|xpm|webp|dng|tif)
  exiftool -c "%d %d %.8f" "$1" |\
  grep "^Make   \|^Create Date\|^ISO   \|^File Name\|^GPS Position\|^Focal Length   \|^F Number\|^Exposure Time\|^Lens Info\|^Aperture\|^Shutter Speed\|^Camera Model Name\|^Model   \|^Image Size"
  ;;
  avi|mp4|wmv|dat|3gp|ogv|mkv|mpg|mpeg|vob|fl[icv]|\
  m2v|mov|webm|ts|mts|m4v|r[am]|qt|divx)
  exiftool -c "%d %d %.8f" "$1" |\
  grep "^Make   \|^Create Date\|^ISO   \|^File Name\|^GPS Position\|^Focal Length   \|^F Number\|^Exposure Time\|^Lens Info\|^Aperture\|^Shutter Speed\|^Model\|^Frame Rate\|^Duration\|^Image Size\|^Avg Bitrate\|^Compressor ID"
  ;;
  wav|mp3|flac|m4a|wma|ape|ac3|og[agx]|spx|opus|as[fx])
  exiftool "$1" |\
  grep "^Audio Bitrate\|^File Name\|^Duration\|^Audio Codec ID"
  ;;
  *) echo "its not either"
  ;;
esac
