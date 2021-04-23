ifconfig ppp0 | grep inet | awk 'BEGIN{m=5}{print "route add default gw ",$2}' > /tmp/hl_add_ppp0
sleep 1
route delete default ppp0
sh /tmp/hl_add_ppp0
echo "hl_try_add_routes_lte.sh: add default route success!"

(
echo "-----[ps]------"
ps -l
echo "-----[use_lan]------"
cat /app/etc/sysmanager.conf
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
)>/app/lte_snapshot.log
