
docker run -it -e LOCAL_USER=$env:UserName -e LOCAL_HOME=/home/$env:UserName -v ~:/home/$env:UserName -v ~/bsoe/software:/software -e DISPLAY=192.168.1.100:0.0 vlsida/openram-ubuntu:latest
