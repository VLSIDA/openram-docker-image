
$ipV4 = Test-Connection -ComputerName (hostname) -Count 1  | Select -ExpandProperty IPV4Address
$ipV4 = $ipV4.IPAddressToString
docker run -it -e LOCAL_USER=$env:UserName -e LOCAL_HOME=/home/$env:UserName -v ~/bsoe/software:/software -v ~:/home/$env:UserName  -e DISPLAY="$ipV4":0.0 vlsida/openram-ubuntu:latest