#!/bin/sh
eval `dbus export linkease`
source /jffs/softcenter/scripts/base.sh
alias echo_date='echo $(date +%Y年%m月%d日\ %X):'

BIN=/jffs/softcenter/bin/linkease
PID_FILE=/var/run/linkease.pid

start_ee(){
	start-stop-daemon -S -q	-b -m -p $PID_FILE -x $BIN
	[ ! -L "/jffs/softcenter/init.d/S99linkease.sh" ] && ln -sf /jffs/softcenter/scripts/linkease_config.sh /jffs/softcenter/init.d/S99linkease.sh
	[ ! -L "/jffs/softcenter/init.d/N99linkease.sh" ] && ln -sf /jffs/softcenter/scripts/linkease_config.sh /jffs/softcenter/init.d/N99linkease.sh
}

kill_ee(){
	killall	linkease > /dev/null 2>&1
}

load_iptables(){
	iptables -S | grep "8897" | sed 's/-A/iptables -D/g' > clean.sh && chmod 777 clean.sh && ./clean.sh && rm clean.sh > /dev/null 2>&1
	iptables -t	filter -I INPUT -p tcp --dport 8897 -j ACCEPT > /dev/null 2>&1
}

del_iptables(){
	iptables -S | grep "8897" | sed 's/-A/iptables -D/g' > clean.sh && chmod 777 clean.sh && ./clean.sh && rm clean.sh > /dev/null 2>&1
}

#=========================================================
case $ACTION in
start)
	if [ "$linkease_enable" == "1" ];then
		logger "[软件中心]: 启动linkease插件！"
		kill_ee
		start_ee
		load_iptables
	else
		logger "[软件中心]: linkease插件未开启，不启动！"
	fi
	;;
start_nat)
		load_iptables
	;;
stop)
		kill_ee
		del_iptables
	;;
*)
	if [ "$linkease_enable" == "1" ];then
		kill_ee
		start_ee
		load_iptables
	else
		kill_ee
		del_iptables
	fi
	;;
esac
