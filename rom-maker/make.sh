#!/bin/sh

echo "Build system image ..."
mkimage -C none -A arm -T script -d bootcmd/boot.cmd part1/boot.scr
rm -fr part3/* >/dev/null 2>&1
touch part3/EMPTY
touch part3/DO_NOT_ADD_FILES
./mkimage.sh -c 2 -m partmap/partmap.txt -d "misc/;part1/;part2/;part3/"
