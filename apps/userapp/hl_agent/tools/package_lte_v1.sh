#!/bin/sh
read version <version
echo $version

echo_call() {
  echo $@
  $@
}

echo_call rm -rf /var/tmp/hl_package_lte/*

echo_call mkdir -p /var/tmp/hl_package_lte/hl_agent/lua

for i in ./lua/*.lua; do
  echo_call ./bin/hl_luac -o /var/tmp/hl_package_lte/hl_agent/lua/`basename $i` $i
done
echo_call cp -f ./lua/hl_config.lua /var/tmp/hl_package_lte/hl_agent/lua/hl_config.lua

echo_call cp -rf bin cache libs libs_so logs tools version .task /var/tmp/hl_package_lte/hl_agent/
rm -f /var/tmp/hl_package_lte/hl_agent/bin/hl_luac

echo_call cd /var/tmp/hl_package_lte/

echo_call tar czvf lte_v${version}_full.tar.gz hl_agent

echo_call mv lte_v${version}_full.tar.gz /var/tmp/

echo_call rm -rf /var/tmp/hl_package_lte

