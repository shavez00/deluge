This is a script to launch Deluge in a Docker container on Raspbian.

This script assumes that you already have Docker installed on your Raspberry Pi.  If you need help in how to install Docker on the Raspberry Pi, go to the [Docker Docs](https://docs.docker.com/engine/installation/linux/docker-ce/debian/#install-using-the-repository).

In order to make the script run everytime the Raspberry Pi reboots, do the following.

Download the deluge_container_launch.sh file.

Then run the following commands.

cp deluge_container_launch.sh /etc/init.d/

update-rc.d deluge_container_launch.sh defaults

All done!  Now everytime that your Raspberry Pi reboots Deluge will automatically be launched in a Docker Container.
