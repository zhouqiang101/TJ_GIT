#!/bin/sh

cp hl_audiobox.config .config
make zImage dtbs ARCH=arm CROSS_COMPILE=arm-linux- V=1 -j8
make modules ARCH=arm CROSS_COMPILE=arm-linux- -j8
echo "Please run ./install.sh to install kernel, dtb and modules"
