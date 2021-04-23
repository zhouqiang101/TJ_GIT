#!/bin/sh
read version <version
echo $version

echo_call() {
  echo $@
  $@
}

TARGET=/mnt/emmc/tmp
echo_call mkdir -p $TARGET
echo_call rm -rf $TARGET/hl_agent*
echo_call cp -rf . $TARGET/hl_agent
echo_call rm -rf $TARGET/hl_agent/bin/lua* $TARGET/hl_agent/bin/hl_luac $TARGET/hl_agent/tools $TARGET/hl_agent/logs/*
for i in ./lua/*.lua; do
  echo_call ./bin/hl_luac -s -o $TARGET/hl_agent/lua/`basename $i` $i
done
echo_call cp ./lua/hl_config.lua $TARGET/hl_agent/lua
echo_call cp ./lua/hl_set_* $TARGET/hl_agent/lua
echo_call mkdir -p $TARGET/hl_agent/.tasks

echo_call cd $TARGET
echo_call tar czf hl_agent-${version}.tar.gz hl_agent
echo_call rm -rf hl_agent

echo_call cd /usr/fs/usr
echo_call rm -rf hl_agent
echo_call tar xzf $TARGET/hl_agent-${version}.tar.gz
