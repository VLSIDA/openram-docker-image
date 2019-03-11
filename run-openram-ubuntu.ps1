
$ipV4 = Test-Connection -ComputerName (hostname) -Count 1  | Select -ExpandProperty IPV4Address
$ipV4 = $ipV4.IPAddressToString
$USER = $env:UserName.ToLower()
docker run -it -e LOCAL_USER=$USER -e LOCAL_HOME=/home/$USER -v ~/bsoe/software:/software -v ~:/home/$USER  -e DISPLAY="$ipV4":0.0 vlsida/openram-ubuntu:latest