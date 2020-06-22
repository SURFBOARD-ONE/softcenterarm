#!/bin/sh

MODULE="linkease"
VERSION="2.5"
TITLE="易有云2.0"
DESCRIPTION="易有云2.0 （LinkEase） 手机相册同步，PC 双向同步！"
HOME_URL="Module_linkease.asp"

# Check and include base
DIR="$( cd "$( dirname "$BASH_SOURCE[0]" )" && pwd )"

# now include build_base.sh
. $DIR/../softcenter/build_base.sh

# change to module directory
cd $DIR

# do something here
do_build_result
