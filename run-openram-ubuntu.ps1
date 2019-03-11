
docker run -it -e LOCAL_USER=$env:UserName -e LOCAL_HOME=/home/$env:UserName -v ~:/home/$env:UserName -v ~/bsoe/software:/software -e DISPLAY="$env:ComputerName":0.0 vlsida/openram-ubuntu:latest
