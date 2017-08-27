#! /bin/sh
### BEGIN INIT INFO
# Provides:          deluge_container_launch
# Required-Start:    $all
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Manage my cool stuff
### END INIT INFO

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin

. /lib/init/vars.sh
. /lib/lsb/init-functions
# If you need to source some other scripts, do it here

case "$1" in
  start)
    log_begin_msg "Attempting to run docker container image for Deluge"
    if docker run -p 8112:8112 -p 58846-58946:58846-58946 -d -v /download:/downloads -v /home/pi/deluge/config:/config --name deluge lsioarmhf/deluge 2> /dev/null ; then
      echo "Successfully launched Deluge container"
      exit 0
    else
      if sudo docker start deluge ; then
        echo "A container with the name Deluge already exists"
        echo "Sucessfully started existing Deluge container"
        exit 0
      else
        echo "Failed to launch Deluge container"
      fi
    fi
    log_end_msg $?
    exit 0
    ;;
  stop)
    log_begin_msg "Stopping the Deluge Container"

    docker stop deluge

    log_end_msg $?
    exit 0
    ;;
  *)
    echo "Usage: /etc/init.d/deluge_container_launch.sh {start|stop}"
    exit 1
    ;;
esac
