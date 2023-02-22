#!/bin/sh
#echo 3 > /sys/bus/i2c/devices/2-0030/eqmode
#sleep 1
#echo 1 > /sys/bus/i2c/devices/2-0030/eqmode

cd /app/hl_agent
LOG_MAX=1000000

fail_times=0

while /bin/true; do
  if [ -f /app/hl_agent/logs/hl_agent.log ]; then
    log_size=`ls -l /app/hl_agent/logs/hl_agent.log |awk '{print $5}'`
    #echo "log_size=$log_size"
    if [ $log_size -gt $LOG_MAX ]; then
      if [ -f /app/hl_agent/logs/hl_agent.log.10 ]; then
        rm -f /app/hl_agent/logs/hl_agent.log.10
      fi
      i=9
      while [ $i -ge 1 ]; do
        j=`expr $i + 1`
        if [ -f /app/hl_agent/logs/hl_agent.log.$i ]; then
          mv /app/hl_agent/logs/hl_agent.log.$i /app/hl_agent/logs/hl_agent.log.$j
        fi
        i=`expr $i - 1`
      done
      cp /app/hl_agent/logs/hl_agent.log /app/hl_agent/logs/hl_agent.log.1
      echo > /app/hl_agent/logs/hl_agent.log
    fi
  fi


  if ! ps -ef |grep hl_lua |grep -v grep >/dev/null; then
     fail_times=`expr $fail_times + 1`
     #killall mplayer player ; sleep 2 && player -b && sleep 1
    echo "process not exists, start it ..."
    ./bin/hl_lua ./lua/hl_agent.lua lte >>/app/hl_agent/logs/hl_agent.log 2>&1 &
    sleep 1
    echo "done"
  else
     fail_times=0
  fi

  sleep 5

  if ! ./bin/hl_lua ./lua/hl_live_checklte.lua; then
    echo "process no response, restart it ... "
    killall -9 hl_lua
	sleep 1
    ./bin/hl_lua ./lua/hl_agent.lua lte >>/app/hl_agent/logs/hl_agent.log 2>&1 &
    #touch /app/hl_agent/hl_restart
    #./bin/hl_lua ./lua/hl_agent.lua 3nod >>/mnt/emmc/hl_agent.log 2>&1 &
    #reboot
    echo "done"
  fi
  sleep 3

  if ! ps -ef |grep hl_ltedog |grep -v grep >/dev/null; then
    echo "hl_ltedog no response, restart it ... "
    killall -9 hl_ltedog
    sleep 1
    /app/hl_agent/bin/lte_create.sh &
  fi 
  sleep 3
done
