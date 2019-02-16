#!/bin/bash

USER=${LOCAL_USER:-cad-user}
HOME=${LOCAL_HOME:-/home/cad-user}
echo "Starting with UID : $USER HOME=$HOME"
adduser --quiet --disabled-password --home $HOME  --shell /bin/bash --gecos "" $USER 2> /dev/null
cd $HOME
gosu $USER /bin/bash --rcfile /set-paths.sh
