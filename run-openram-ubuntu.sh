#!/bin/bash                                                                                                                                                  
docker run -it -e LOCAL_USER=$USER -e LOCAL_HOME=$HOME -v $HOME:${HOME} -v $HOME/bsoe/software:/software vlsida/openram-ubuntu            
