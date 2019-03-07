#!/bin/bash                                                                                                                                                  
ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')                                                                                                 
xhost + $ip                                                                                                                                                  
display_number=`ps -ef | grep "Xquartz :\d" | grep -v xinit | awk '{ print $9; }'`                                                                           
docker run -it -e LOCAL_USER=$USER -e LOCAL_HOME=$HOME -v $HOME:${HOME} -v $HOME/bsoe/software:/software -e DISPLAY=$ip$display_number -v /tmp/.X11-unix:/tmp/.X11-unix vlsida/openram-ubuntu:latest 
