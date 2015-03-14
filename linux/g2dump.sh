#!/bin/bash

START=${1:-"2014-10-27"}
TODAY=$2

if [[ -z $TODAY ]]; then
  TODAY=$(date +%s -d "$(date "+%Y%m%d")")
else
  TODAY=$(date +%s -d "$TODAY")
fi

while [ $(date +%s -d "$START") -le $TODAY ]; do
  if [ -f $START.txt ]; then
    echo $START.txt already exists. Skipping.
  else
    curl "http://www.galcon.com/g2/logs/$START.txt" -O
  fi
  START=$(date +%Y-%m-%d -d "$START +1 day")
done
