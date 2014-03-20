#!/bin/bash

auto_telnet() {
	expect -c "spawn telnet $1
		expect name:
		send $2\r
		expect assword:
		send $3\r
		interact"
} 

if [ "$1" == "" ]; then
	auto_telnet "9.115.21.22" $INTRANET_ID $INTRANET_PWD
	auto_telnet "9.30.215.90" $INTRANET_ID $INTRANET_PWD
	auto_telnet "9.5.5.42" $INTRANET_ID $INTRANET_PWD
else
	auto_telnet $1 $INTRANET_ID $INTRANET_PWD
fi 
