#!/bin/bash
# Use this feature if you want to be able to run gdb or other debuggers.
docker run -it --cap-add=SYS_PTRACE -e LOCAL_USER=$USER -e LOCAL_HOME=$HOME -v $HOME:${HOME} -v $HOME/bsoe/software:/software vlsida/openram-ubuntu:latest
