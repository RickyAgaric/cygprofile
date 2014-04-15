#!/bin/bash
servers='9.115.21.163
9.30.215.90
9.5.5.42
9.30.199.184'


throughFirewall() {
	expect -c "
		spawn telnet $1
		expect {
			default {exit}
			\"name:\" {send $2\r;exp_continue}
			\"assword:\" {send $3\r;exp_continue}
		}
		interact"
}

if [ "$1" == "" ]; then
	for server in ${servers}
	do
		throughFirewall ${server} ${INTRANET_ID} ${INTRANET_PWD}
	done
else
	throughFirewall ${1} ${INTRANET_ID} ${INTRANET_PWD}
fi 
