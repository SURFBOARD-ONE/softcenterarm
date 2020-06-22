#!/bin/sh
source /jffs/softcenter/scripts/base.sh
alias echo_date='echo 【$(TZ=UTC-8 date -R +%Y年%m月%d日\ %X)】:'
module=linkease
DIR=$(cd $(dirname $0); pwd)
MODEL=$(nvram get productid)
if [ "$MODEL" == "GT-AC5300" ] || [ "$MODEL" == "GT-AX11000" ] || [ "$MODEL" == "GT-AC2900" ] || [ "$(nvram get merlinr_rog)" == "1" ];then
	ROG=1
elif [ "$MODEL" == "TUF-AX3000" ] || [ "$(nvram get merlinr_tuf)" == "1" ] ;then
	TUF=1
fi
echo_date "开始安装linkease..."
cd /tmp
ee_en=`dbus get linkease_enable`
if [ "${ee_en}"x = "1"x ];then
    /jffs/softcenter/scripts/linkease_config.sh stop
fi
rm -f /jffs/softcenter/bin/linkease.log
rm -f /jffs/softcenter/bin/_ffprobe_cache /jffs/softcenter/scripts/_ffprobe_cache
cp -rf /tmp/linkease/bin/* /jffs/softcenter/bin/
cp -rf /tmp/linkease/scripts/* /jffs/softcenter/scripts/
cp -rf /tmp/linkease/webs/* /jffs/softcenter/webs/
cp -rf /tmp/linkease/res/* /jffs/softcenter/res/
if [ "$ROG" == "1" ];then
	continue
else
	if [ "$TUF" == "1" ];then
		sed -i 's/3e030d/3e2902/g;s/91071f/92650F/g;s/680516/D0982C/g;s/cf0a2c/c58813/g;s/700618/74500b/g;s/530412/92650F/g' /jffs/softcenter/webs/Module_${module}.asp >/dev/null 2>&1
	else
		sed -i '/rogcss/d' /jffs/softcenter/webs/Module_${module}.asp >/dev/null 2>&1
	fi
fi
chmod a+x /jffs/softcenter/bin/linkease
chmod a+x /jffs/softcenter/scripts/linkease_config.sh
chmod a+x /jffs/softcenter/scripts/linkease_status.sh
chmod a+x /jffs/softcenter/scripts/uninstall_linkease.sh
[ ! -L "/jffs/softcenter/init.d/S99linkease.sh" ] && ln -sf /jffs/softcenter/scripts/linkease_config.sh /jffs/softcenter/init.d/S99linkease.sh
[ ! -L "/jffs/softcenter/init.d/N99linkease.sh" ] && ln -sf /jffs/softcenter/scripts/linkease_config.sh /jffs/softcenter/init.d/N99linkease.sh
dbus set linkease_ver=`/jffs/softcenter/bin/linkease showVersion`
dbus set softcenter_module_linkease_name=${MODULE}
dbus set softcenter_module_linkease_title="易有云2.0"
dbus set softcenter_module_linkease_description="易有云2.0 相册备份，双向同步，历史版本。"
dbus set softcenter_module_linkease_version="$(cat $DIR/version)"
dbus set softcenter_module_linkease_install=1
rm -rf /tmp/linkease* >/dev/null 2>&1
if [ "${ee_en}"x = "1"x ];then
    /jffs/softcenter/scripts/linkease_config.sh restart
fi
echo_date "linkease插件安装完毕！"
exit 0
