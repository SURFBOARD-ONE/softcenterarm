#!/bin/sh


MODULE=ddnsto
VERSION=2.9.2
TITLE=DDNSTO远程控制
DESCRIPTION="koolshare小宝开发的基于http2的远程控制，仅支持远程管理路由器+nas+windows远程桌面。"
HOME_URL=Module_ddnsto.asp

# Check and include base
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ "$MODULE" == "" ]; then
	echo "module not found"
	exit 1
fi

if [ -f "$DIR/$MODULE/$MODULE/install.sh" ]; then
	echo "install script not found"
	exit 2
fi

# now include build_base.sh
. $DIR/../softcenter/build_base.sh

# change to module directory
cd $DIR

# do something here

do_build_result

sh backup.sh $MODULE
