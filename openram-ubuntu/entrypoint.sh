#!/bin/bash

USER=${LOCAL_USER:-cad-user}
HOME=${LOCAL_HOME:-/home/cad-user}
echo "Starting with UID : $USER HOME=$HOME"
adduser --quiet --disabled-password --home $HOME  --shell /bin/bash --gecos "" $USER 2> /dev/null
echo "Execute this:"
echo "source /usr/local/bin/set-paths.sh"
cd $HOME
exec gosu $USER /bin/bash 
