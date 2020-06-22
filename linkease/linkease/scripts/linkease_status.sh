#! /bin/sh

linkease_pid=`pidof linkease`
#TODO echo version
linkease_ver=`dbus get linkease_ver`
if [ -n "$linkease_pid" ];then
    echo 进程运行正常！版本：${linkease_ver} （PID：$linkease_pid） > /tmp/linkease.log
else
    echo \<em\>【警告】：进程未运行！\<\/em\> 版本：${linkease_ver} > /tmp/linkease.log
fi
#echo XU6J03M6 >> /tmp/linkease.log
#sleep 3
#rm -f /tmp/linkease.log
