#!/bin/bash
echo "Starting background index"
bgindex.sh &
echo "Starting recoll-webui"
# python 3 not working
/usr/bin/python2 /home/docker/recoll-webui/webui-standalone.py -a 0.0.0.0 -c /home/docker/data/.recoll/

#start service
service incron start
#debug to see what is going on
tail -f /dev/null
