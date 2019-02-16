Docker images for OpenRAM

# Installing Docker

There are a number of ways to install Docker.  Pick your favorite.

On Mac with Macports:
 port install docker
On Mac from docker.com with .app:
 https://docs.docker.com/docker-for-mac/install/
On Mac from docker.com with toolbox only:
 https://docs.docker.com/toolbox/toolbox_install_mac/
On Windows from docker.com:
 https://docs.docker.com/docker-for-windows/install/
On Ubuntu:
 https://docs.docker.com/install/linux/docker-ce/ubuntu/

# Running Docker

To run as a generic user (with no saved home directory:

 docker run -it vlsida/openram-ubuntu

To mount your home directory:

 docker run -it -e LOCAL_USER=$USER -e LOCAL_HOME=$HOME -v $HOME:${HOME} vlsida/openram-ubuntu

To mount proprietary CAD tools installed in $HOME/bsoe/software:

 docker run -it -e LOCAL_USER=$USER -e LOCAL_HOME=$HOME -v $HOME:${HOME} -v $HOME/bsoe/software:/software vlsida/openram-ubuntu

# Licenses

If you need licenses, you must set up the campus Cisco Annyconnect VPN on your
host computer (i.e. laptop, not the docker image) to campus:

https://its.ucsc.edu/vpn/installation.html

# X11 

## On Mac

1. Download and install XQuarts
2. Enable "Allow connections from network clients" in the Preferences...Security menu.
3. Restart XQuarts for settings to take effect.
4. Make a little script with (included as run_osx.sh):

```
#!/bin/bash
ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
xhost + $ip
display_number=`ps -ef | grep "Xquartz :\d" | grep -v xinit | awk '{ print $9; }'`
docker run -it -e LOCAL_USER=$USER -e LOCAL_HOME=$HOME \
-v $HOME:${HOME} \
-v $HOME/bsoe/software:/software  \
-e DISPLAY=$ip$display_number \
-v /tmp/.X11-unix:/tmp/.X11-unix \
vlsida/openram-ubuntu
```
