This is a script to launch Deluge in a Docker container on Raspbian

In order to make the script run everytime the Raspberry Pi reboots, do the following.

/# update boot / reboot files

cp deluge_container_launch.sh /etc/init.d/

/# do it as soon as the device is going down,
/#   both for shutdown and reboot

update-rc.d deluge_container_launch.sh defaults
