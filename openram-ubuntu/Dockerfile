FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive
RUN ln -s /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
RUN echo "America/Los_Angeles" > /etc/timezone

RUN apt-get update
RUN apt-get --no-install-recommends -y upgrade

### Dependencies ###
# General tools for building etc.
RUN apt-get install --no-install-recommends -y build-essential git ssh vim gosu
RUN apt-get install --no-install-recommends -y autoconf automake libtool bison flex
# Needed by OpenRAM
RUN apt-get install --no-install-recommends -y  python3 python3-numpy python3-scipy
# Needed by Netgen
RUN apt-get install --no-install-recommends -y m4 csh  tk tk-dev tcl-dev
# Needed by ngspice
RUN apt-get install --no-install-recommends -y libxaw7-dev
# X11 dev not used
RUN apt-get install --no-install-recommends -y libx11-dev libcairo2-dev 
# Needed by calibre
RUN apt-get install --no-install-recommends -y libglu1-mesa-dev freeglut3-dev mesa-common-dev

### Magic ###

# This would install the default Ubuntu version which
# is an old one...
#RUN apt-get install --no-install-recommends -y magic

# Compile the newest
WORKDIR /root
RUN git clone git://opencircuitdesign.com/magic-8.2
WORKDIR /root/magic-8.2
RUN ./configure \
 && make \
 && make install
RUN rm -rf /root/magic-8.2

### Ngspice ###

#This would install ngspice 29 which is old
#RUN apt-get install --no-install-recommends -y ngspice

# Compile the newest
WORKDIR /root
RUN git clone git://git.code.sf.net/p/ngspice/ngspice
WORKDIR /root/ngspice
RUN ./autogen.sh \
 && ./configure --enable-openmp \
 && make \
 && make install
RUN rm -rf /root/ngspice

### Netgen ###
WORKDIR /root
RUN git clone git://opencircuitdesign.com/netgen-1.5
WORKDIR /root/netgen-1.5
RUN ./configure \
 && make -j$(nproc) \
 && make install
RUN rm -rf /root/netgen-1.5

### FREEPDK 15 and 45 PDKs ###
# These are put in /home/PDKs
ADD PDKs.tar.gz /home

### SET UP A GENERIC USER ###
WORKDIR /
RUN echo "cd ~" >> /etc/skel/.bashrc
RUN echo "source /set-paths.sh" >> /etc/skel/.bashrc
ADD set-paths.sh /set-paths.sh
RUN chmod 755 /set-paths.sh

### Utilities ###
# Network debug tools (can be removed to save space)
RUN apt-get install --no-install-recommends -y iputils-ping net-tools lsof wget whois nmap telnet curl dnsutils tcpdump traceroute
# Needed to run lmstat
RUN apt-get install -y --no-install-recommends lsb lsb-release lsb-core 

### CLEAN UP ###

# Remove development tools to save space
RUN apt-get remove -y build-essential autoconf automake libtool bison flex  tcl-dev tk-dev
# Cleanup to save some space
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

### ADD ENTRY POINT ###
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod 755 /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/bin/bash"]

