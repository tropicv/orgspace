#!/bin/sh

echo Content-type: text/plain
echo

home=`pwd`;

/bin/test ! -f $home/../../../cron/progress || exit 0
echo "Start Sync";
touch $home/../../../cron/ready;


