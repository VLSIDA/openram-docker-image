# Docker images for OpenRAM #

## Installing Docker ##

There are a number of ways to install Docker.  Pick your favorite.

* On Mac with [Macports](https://www.macports.org/ "Macports"):
```
 port install docker
```

* On Mac from docker.com with .app:
 https://docs.docker.com/docker-for-mac/install/

* On Mac from docker.com with toolbox only:
 https://docs.docker.com/toolbox/toolbox_install_mac/

* On Windows from docker.com:
 https://docs.docker.com/docker-for-windows/install/

* On Ubuntu:
 https://docs.docker.com/install/linux/docker-ce/ubuntu/


## Running Docker ## 


* To run, mount your home directory, mount proprietary CAD tools installed in $HOME/bsoe/software:

```
 docker run -it -e LOCAL_USER=$USER -e LOCAL_HOME=$HOME -v $HOME:${HOME} -v $HOME/bsoe/software:/software vlsida/openram-ubuntu
 ```
This is available in the script [run-openram-ubuntu.sh](run-openram-ubuntu.sh). Remove the -v software option to not mount that.

* To run as a generic user (with no saved home directory):

```
 docker run -it vlsida/openram-ubuntu
```


## Updating the image ##

If there are updates to the image, you can pull a new one from the hub with:

```
docker pull vlsida/openram-ubuntu
```

## Building your own image ##

You can run the build script to build a local image:

```
./build.sh
```

If you want to change things, modify the openram-ubuntu/Dockerfile and let me know what should be fixed.

## Licenses ##

This is not working yet. Anyconnect will destroy the network connection to the docker-machine.

If you need licenses, you must set up the campus Cisco Annyconnect VPN on your
host computer (i.e. laptop, not the docker image) to campus:

https://its.ucsc.edu/vpn/installation.html

## X11 ##

### On Mac ###

1. Download and install [XQuartz](https://www.xquartz.org/ "XQuartz")
2. Enable "Allow connections from network clients" in the Preferences...Security menu.
3. Restart XQuartz for settings to take effect.
4. An example startup script is [run-openram-ubuntu-osx-x11.sh](run-openram-ubuntu-osx-x11.sh).

### On PC ###

TBD
