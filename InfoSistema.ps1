function sysInfo
{
    Get-WmiObject -Class Win32_Product -ComputerName .
}