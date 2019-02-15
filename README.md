Docker images for OpenRAM

To mount your home directory:

docker run -it -e LOCAL_USER_ID=$(id -u $USER) -v $HOME:${HOME} openram-ubuntu

To mount proprietary CAD tools installed at $SWROOT:

docker run -it -e LOCAL_USER_ID=$(id -u $USER) -v $HOME:${HOME} -v $SWROOT:/software openram-ubumtu

If you need licenses, you must set up the campus Cisco Annyconnect VPN on your
host computer (i.e. laptop, not the docker image)::

https://its.ucsc.edu/vpn/installation.html
