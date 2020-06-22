#!/bin/sh
eval `dbus export linkease_`
source /jffs/softcenter/scripts/base.sh
logger "[软件中心]: 正在卸载 LinkEase 文件同步..."
MODULE=linkease
cd /
/jffs/softcenter/scripts/linkease_config.sh stop
rm -f /jffs/softcenter/init.d/S99linkease.sh
rm -f /jffs/softcenter/init.d/N99linkease.sh
rm -f /jffs/softcenter/scripts/linkease_config.sh
rm -f /jffs/softcenter/scripts/linkease_status.sh
rm -f /jffs/softcenter/webs/Module_linkease.asp
rm -f /jffs/softcenter/res/icon-linkease.png
rm -f /jffs/softcenter/res/linkease_check.html
rm -f /jffs/softcenter/bin/linkease
rm -f /jffs/softcenter/bin/linkease.log /tmp/linkease.log
rm -f /jffs/softcenter/bin/_ffprobe_cache /jffs/softcenter/scripts/_ffprobe_cache /tmp/_ffprobe_cache
rm -f /tmp/var/run/linkease.pid
linkease_iptables_num=$(iptables -nL INPUT | grep -ci "INPUT_LinkEase")
while [[ "${linkease_iptables_num}" != 0 ]]  
do
    iptables -D INPUT -j INPUT_LinkEase
    linkease_iptables_num=$(expr ${linkease_iptables_num} - 1)
done
iptables -F INPUT_LinkEase
iptables -X INPUT_LinkEase
rm -fr /tmp/linkease* >/dev/null 2>&1
values=`dbus list linkease | cut -d "=" -f 1`
for value in $values
do
dbus remove $value 
done
logger "[软件中心]: 完成 LinkEase 文件同步 卸载"
rm -f /jffs/softcenter/scripts/uninstall_linkease.sh
