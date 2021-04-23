#!/bin/sh

TOPDIR=`pwd`

UBOOT_INSTALL_PATH=$TOPDIR/rom-maker/misc
KERNEL_INSTALL_PATH=$TOPDIR/rom-maker/part1
ROOTFS_INSTALL_PATH=$TOPDIR/rom-maker/part2

echo "************************************************"
echo "This script will build image for EC20 lte module"
echo "************************************************"
sleep 3
cd $TOPDIR
rm filesystem/files/etc/ppp/peers/lte >/dev/null 2>&1
cp ppp_script/ec20 filesystem/files/etc/ppp/peers/lte >/dev/null 2>&1

echo "Clean rom-maker ..."
cd rom-maker
./clean.sh
cd $TOPDIR

echo "Building u-boot ..."
cd bsp/u-boot
./make.sh
if [ ! -f u-boot-sunxi-with-spl.bin ]; then
	echo "u-boot build failed"
	exit 1
fi
cp -a u-boot-sunxi-with-spl.bin $UBOOT_INSTALL_PATH/
cd $TOPDIR

echo "Building kernel ..."
cd bsp/kernel-4.14
./make.sh
if [ ! -f arch/arm/boot/zImage ]; then
	echo "kernel build failed"
	exit 1
fi
./install.sh
cp -a compiled_output/boot/* $KERNEL_INSTALL_PATH/
if [ -f $TOPDIR/hw.conf ]; then
	echo ""
	echo "[WARNING] ****** Using example hw.conf ******"
	echo "[WARNING]     This file is ONLY for debug"
	echo "[WARNING] ***********************************"
	echo ""
	cp $TOPDIR/hw.conf $KERNEL_INSTALL_PATH/
fi
rm -fr $TOPDIR/filesystem/files/lib/modules >/dev/null 2>&1
cp -a compiled_output/root/lib/modules $TOPDIR/filesystem/files/lib/
cd $TOPDIR

echo "Building filesystem ..."
cd filesystem
./prepare.sh
make -j8
if [ ! -f output/images/rootfs.tar ]; then
	echo "filesystem build failed"
	exit 1
fi
tar -xf output/images/rootfs.tar -C $ROOTFS_INSTALL_PATH/
cd $ROOTFS_INSTALL_PATH
rm -fr var/* >/dev/null 2>&1
rm -fr root/* >/dev/null 2>&1
rm -fr media/* >/dev/null 2>&1
chmod 777 root
cd $TOPDIR

echo "Installing system bin ..."
cd apps/sysbin
chmod +x * >/dev/null 2>&1
cp -a * $ROOTFS_INSTALL_PATH/bin/
cd $TOPDIR

echo "Packaging factory application ..."
cd apps/facapp
tar -zcvf ../factory.tar.gz *
mv ../factory.tar.gz $ROOTFS_INSTALL_PATH/usr/share/rtmfs/
cd $TOPDIR

echo "Packaging user application ..."
cd apps/userapp
tar -zcvf ../userapp.tar.gz *
mv ../userapp.tar.gz $ROOTFS_INSTALL_PATH/usr/share/rtmfs/
cd $TOPDIR

echo "Building final image ..."
cd rom-maker
./make.sh
if [ ! -f out/SD-bootable-2.img ]; then
	echo "final image build failed"
	exit 1
fi
rm -fr $TOPDIR/hl_audiobox.img >/dev/null 2>&1
mv out/SD-bootable-2.img $TOPDIR/hl_audiobox.img
cd $TOPDIR

echo "All done"
exit 0
