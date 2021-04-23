#!/bin/sh

TOPDIR=`pwd`

echo "Clean u-boot ..."
cd bsp/u-boot
make make ARCH=arm CROSS_COMPILE=arm-linux- distclean
cd $TOPDIR

echo "Clean kernel ..."
cd bsp/kernel-4.14
./clean.sh
cd $TOPDIR

echo "Clean filesystem ..."
cd filesystem
make distclean
./clean.sh
cd $TOPDIR

echo "Clean rom-maker ..."
cd rom-maker
./clean.sh
cd $TOPDIR

rm -fr hl_audiobox.img >/dev/null 2>&1

echo "All cleaned"
