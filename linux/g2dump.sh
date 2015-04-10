#!/bin/bash

START=${1:-"2014-10-27"}
TODAY=$2

OPTIND=1

FROM="2014-10-27"
TO=$(date +%s -d "$(date "+%Y%m%d")")
OUTPUT="./"
SOURCE="http://www.galcon.com/g2/logs/"
COMPRESS=false
DOWNLOAD_COMPRESSED=false

while getopts "f:t:o:s:cx" OPT; do
  case "$OPT" in
    f) #from
      FROM=$OPTARG
      ;;
    t) #to
      TO=$(date +%s -d "$OPTARG")
      ;;
    o) #output directory
      OUTPUT=$OPTARG
      ;;
    s) #source
      SOURCE=$OPTARG
      ;;
    c) #enable compression
      COMPRESS=true
      ;;
    x) #try to download compressed .tgz versions of the dump (and extract them)
      DOWNLOAD_COMPRESSED=true
      ;;
  esac
done

while [ $(date +%s -d "$FROM") -le $TO ]; do
  if [ -f $OUTPUT$FROM.txt ]; then
    echo $FROM.txt already exists. Skipping.
  else
    if [ $DOWNLOAD_COMPRESSED = true ]; then
      if [ ! -f $OUTPUT$FROM.txt ]; then
        curl "$SOURCE$FROM.tgz" -f -o "$OUTPUT$FROM.tgz"
      fi

      if [ -f $OUTPUT$FROM.tgz ]; then
        tar -C "$OUTPUT" -zxvf "$FROM.tgz"
      else
        curl "$SOURCE$FROM.txt" -f -o "$OUTPUT$FROM.txt"
      fi
    else
      curl "$SOURCE$FROM.txt" -f -o "$OUTPUT$FROM.txt"
    fi
  fi

  if [ $COMPRESS = true ]; then
    if [ -f $OUTPUT$FROM.tgz ]; then
      echo $FROM.tgz already exists. Skipping.
    elif [ -f $OUTPUT$FROM.txt ]; then
      tar -C "$OUTPUT" -zcvf "$OUTPUT$FROM.tgz" "$FROM.txt"
    fi
  fi

  FROM=$(date +%Y-%m-%d -d "$FROM +1 day")
done
