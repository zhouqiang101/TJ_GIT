#!/bin/sh

CURR_PATH=`pwd`
OUTPUT_DIR=$CURR_PATH/compiled_output
BOOT_DIR=$OUTPUT_DIR/boot
ROOT_DIR=$OUTPUT_DIR/root

rm -fr $OUTPUT_DIR >/dev/null 2>&1
mkdir -p $BOOT_DIR
mkdir -p $ROOT_DIR
cp arch/arm/boot/zImage $BOOT_DIR/
cp arch/arm/boot/dts/sun8i-*-nanopi-*.dtb $BOOT_DIR/
make modules_install INSTALL_MOD_PATH=$ROOT_DIR/ ARCH=arm CROSS_COMPILE=arm-linux-
rm $ROOT_DIR/lib/modules/4.14.52/source
rm $ROOT_DIR/lib/modules/4.14.52/build

echo "Final boot stuffs in $BOOT_DIR"
echo "Final module stuffs in $ROOT_DIR"
