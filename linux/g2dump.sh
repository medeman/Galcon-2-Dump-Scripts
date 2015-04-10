#!/bin/bash

START=${1:-"2014-10-27"}
TODAY=$2

OPTIND=1

FROM="2014-10-27"
TO=$(date +%s -d "$(date "+%Y%m%d")")
OUTPUT="./"
SOURCE="http://www.galcon.com/g2/logs/"
COMPRESS=false

while getopts "f:t:o:s:c" OPT; do
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
    c)
      COMPRESS=true
  esac
done

while [ $(date +%s -d "$FROM") -le $TO ]; do
  if [ -f $OUTPUT$FROM.txt ]; then
    echo $FROM.txt already exists. Skipping.
  else
    curl "$SOURCE$FROM.txt" -f -o "$OUTPUT$FROM.txt"
  fi

  if [ $COMPRESS = true ]; then
    if [ -f $OUTPUT$FROM.tgz ]; then
      echo $FROM.tgz already exists. Skipping.
    else
      tar -zcvf $OUTPUT$FROM.tgz $OUTPUT$FROM.txt
    fi
  fi

  FROM=$(date +%Y-%m-%d -d "$FROM +1 day")
done
