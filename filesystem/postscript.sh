#!/bin/sh

# This is buildroot post buil script for hl audiobox, DO NOT run

TGT_ROOTFS=$1

echo "Run hl audiobox post build script"

# Make custom root filesystem
rm -fr $TGT_ROOTFS/etc/dhcpcd.conf >/dev/null 2>&1
rm -fr $TGT_ROOTFS/etc/network >/dev/null 2>&1
rm -fr $TGT_ROOTFS/etc/resolv.conf >/dev/null 2>&1
ln -s /tmp/resolv.conf $TGT_ROOTFS/etc/resolv.conf >/dev/null 2>&1
ln -s /tmp/lte_resolv.conf $TGT_ROOTFS/etc/ppp/resolv.conf >/dev/null 2>&1
ln -s /tmp/lte_resolv.conf $TGT_ROOTFS/etc/resolv.conf.tail >/dev/null 2>&1
rm -fr $TGT_ROOTFS/usr/share/dhcpcd/hooks/* >/dev/null 2>&1
rm -fr $TGT_ROOTFS/etc/hostapd.conf >/dev/null 2>&1
rm -fr $TGT_ROOTFS/etc/wpa_supplicant.conf >/dev/null 2>&1
rm -fr $TGT_ROOTFS/etc/init.d/S41dhcpcd >/dev/null 2>&1
rm -fr $TGT_ROOTFS/etc/init.d/S80dnsmasq >/dev/null 2>&1
rm -fr $TGT_ROOTFS/etc/ssh/* >/dev/null 2>&1
rm -fr $TGT_ROOTFS/root/* >/dev/null 2>&1
rm -fr $TGT_ROOTFS/media/* >/dev/null 2>&1
rm -fr $TGT_ROOTFS/tmp/* >/dev/null 2>&1
rm -fr $TGT_ROOTFS/run/* >/dev/null 2>&1
rm -fr $TGT_ROOTFS/var/* >/dev/null 2>&1
chmod 777 $TGT_ROOTFS/etc/ssh
chmod 777 $TGT_ROOTFS/root
chmod 777 $TGT_ROOTFS/media
chmod 777 $TGT_ROOTFS/tmp
chmod 777 $TGT_ROOTFS/run
chmod 777 $TGT_ROOTFS/var
