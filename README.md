# Docker images for OpenRAM #

## Installing Docker ##

There are a number of ways to install Docker.  Pick your favorite.


* On Mac from docker.com with .app:
 https://docs.docker.com/docker-for-mac/install/

* On Windows from docker.com:
 https://docs.docker.com/docker-for-windows/install/

* On Ubuntu:
 https://docs.docker.com/install/linux/docker-ce/ubuntu/

NOTE: If you plan to use a VPN, do *NOT* use the Docker Toolbox for
Mac or the docker from [Macports](https://www.macports.org/
"Macports") as these require a network socket that breaks when you
install some VPN software. To understand the difference, check out [this
page](https://docs.docker.com/docker-for-mac/docker-toolbox/).

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

If you need licenses, you must set up the campus Cisco Annyconnect VPN on your
host computer (i.e. laptop, not the docker image) to campus:

https://its.ucsc.edu/vpn/installation.html

Double check that you are NOT using the Docker Toolbox. If any environment variables are set when you run
```
env | grep DOCKER
```
then you are and your VPN may break the connection to the docker VM.

## X11 ##

### On Mac ###

1. Download and install [XQuartz](https://www.xquartz.org/)
2. Enable "Allow connections from network clients" in the Preferences...Security menu.
3. Restart XQuartz for settings to take effect.
4. An example startup script is [run-openram-ubuntu-osx-x11.sh](run-openram-ubuntu-osx-x11.sh).

### On PC ###

1. Download and install [VcXsrv](https://sourceforge.net/projects/vcxsrv/)
2. Start VcXsrv
3. In the Docker image, set the DISPLAY address to the ip address of your machine with :0 like: 192.168.1.102:0
Or, this can be passed to the docker command with:
```
-e DISPLAY=192.168.1.102:0
```
