#!/bin/bash
user_name="liyixa@cn.ibm.com"
user_pass="xxx"

auto_telnet() {
	expect -c "spawn telnet $1
		expect name:
		send $2\r
		expect assword:
		send $3\r
		interact"
} 

if [ "$1" == "" ]; then
	auto_telnet "9.115.21.22" $user_name $user_pass
	auto_telnet "9.30.215.90" $user_name $user_pass
	auto_telnet "9.5.5.42" $user_name $user_pass
else
	auto_telnet $1 $user_name $user_pass
fi 
