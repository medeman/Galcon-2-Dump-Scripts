#!/bin/bash

START=${1:-"2014-10-27"}
TODAY=$2

if [[ -z $TODAY ]]; then
  TODAY=$(date -j -f "%Y%m%d" "$(date "+%Y%m%d")" "+%s")
else
  TODAY=$(date -j -f "%Y-%m-%d" "$TODAY" "+%s")
fi

while [ $(date -j -f "%Y-%m-%d" "$START" "+%s") -le $TODAY ]; do
  curl "http://www.galcon.com/g2/logs/$START.txt" -O
  START=$(date -v+1d -j -f "%Y-%m-%d" "$START" "+%Y-%m-%d")
done
