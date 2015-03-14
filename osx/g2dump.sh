#!/bin/bash

OPTIND=1

FROM="2014-10-27"
TO=$(date -j -f "%Y%m%d" "$(date "+%Y%m%d")" "+%s")
OUTPUT="./"
SOURCE="http://www.galcon.com/g2/logs/"

while getopts "f:t:o:s:" OPT; do
  case "$OPT" in
    f) #from
      FROM=$OPTARG
      ;;
    t) #to
      TO=$(date -j -f "%Y-%m-%d" "$OPTARG" "+%s")
      ;;
    o) #output directory
      OUTPUT=$OPTARG
      ;;
    s) #source
      SOURCE=$OPTARG
      ;;
  esac
done

while [ $(date -j -f "%Y-%m-%d" "$FROM" "+%s") -le $TO ]; do
  if [ -f $OUTPUT$FROM.txt ]; then
    echo $FROM.txt already exists. Skipping.
  else
    curl "$SOURCE$FROM.txt" -f -o "$OUTPUT$FROM.txt"
  fi
  FROM=$(date -v+1d -j -f "%Y-%m-%d" "$FROM" "+%Y-%m-%d")
done
