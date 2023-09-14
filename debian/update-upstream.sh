#!/bin/sh

set -e

if [ $# -lt 1 ]; then
    printf "Usage: %s NanumFontSetup_TTF_ALL_totalsearch.exe\n" $0
    exit 1
fi
if ! [ -f debian/rules ]; then
    printf "Run in package top folder"
    exit 1
fi

filename=$1

DIR=`mktemp -d`
7z x -o$DIR $filename
find $DIR -name "*.ttf" -exec mv "{}" "." ";"
rm -r $DIR
