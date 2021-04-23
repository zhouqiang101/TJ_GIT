route -n |awk 'BEGIN{m=5}{if($1=="0.0.0.0")print "route add default gw ",$2,"metric ",m--,$8}' > /tmp/hl_route_gw
if [ `cat /tmp/hl_route_gw | wc -l` -eq 2 ]; then
  route delete default
  route delete default
  sh /tmp/hl_route_gw
  echo "hl_try_switch_routes.sh: switch default route success!"
fi
if [ `date +%M`  -eq '00' ]; then
(
echo "-----[ps]------"
ps -l
echo "-----[use_lan]------"
cat /usr/data/use_lan
echo "-----[resolv.conf]------"
cat /etc/resolv.conf
echo "-----[ifconfig]------"
ifconfig
echo "-----[route]------"
route -n
echo "-----[ping dns]------"
ping -c 4 223.5.5.5
echo "-----[ping api]------"
ping -c 4 api.heardlearn.net
)>/mnt/emmc/net_snapshot.log
sleep 10
echo "hl_try_switch_routes: ifconfig eth0 down && ifconfig eth0 up"
ifconfig eth0 down && sleep 15 && ifconfig eth0 up
sleep 30
fi
