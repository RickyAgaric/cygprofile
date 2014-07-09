CC_Client=/c/Clearcase/yli_view_clemclient_main/clemclient
CC_Utils=/c/Clearcase/yli_view_clemutils_main/clemutils
CC_Server=/c/Clearcase/yli_view_clem_main/clem

Dev_Client=/rep/develop/clemclient
Dev_Utils=/rep/develop/clemclient
Dev_Server=/rep/develop/clemclient

help() {
echo "help"
}

update() {
	cd $1
	git checkout develop
	git add -A .
	git status
	git commit -m "rebase from cc on`git branch | grep "*" | sed s/\*//`"
	git push

	sleep 3
	cd $2
	git checkout develop
	git pull
}

if [[ $1 == "client" ]] ; then
	update $CC_Client $Dev_Client
elif [[ $1 == "utils" ]] ; then
	update $CC_Utils $Dev_Utils
elif [[ $1 == "server" ]] ; then
	update $CC_Server $Dev_Server
else
	help
fi
