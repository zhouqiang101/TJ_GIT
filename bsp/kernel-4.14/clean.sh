#!/bin/sh

make ARCH=arm CROSS_COMPILE=arm-linux- distclean
rm -fr compiled_output >/dev/null 2>&1
