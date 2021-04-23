#!/bin/sh

echo "Clean kernel modules ..."
rm -fr files/lib/modules >/dev/null 2>&1

echo "Clean ppp script ..."
rm files/etc/ppp/peers/lte >/dev/null 2>&1
