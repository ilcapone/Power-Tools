
# BOOT

function available-functions{
    Write-Host "help {available-functions}"
    Write-Host "know {know-Host}"
    Write-Host "policy {policy}"
    Write-Host "users {users}"
    Write-Host "time {current-time}"
    Write-Host "services {view-services} "
    Write-Host "hkcu {current_user-registro}"
    Write-Host "cd {move_to_directory}"
    Write-Host "discs {view_available_discs}"
    Write-Host "search {search_resource}"
    Write-Host "ls {ls}"
    Write-Host "ip {ipconfig}"
}

function know-Host {
    Get-WmiObject -Class Win32_ComputerSystem
}

function policy {
    Get-ExecutionPolicy
    Get-ExecutionPolicy -List | Format-Table -AutoSize
}

function users {
    Get-WmiObject -Class Win32_OperatingSystem -ComputerName . | Select-Object -Property NumberOfLicensedUsers,NumberOfUsers,RegisteredUser
}

function current-time {
    Get-WmiObject -Class Win32_LocalTime -ComputerName . | Select-Object -Property [a-z]* # 
}

function view-services {
    Get-WmiObject -Class Win32_Service -ComputerName . | Format-Table -Property Status,Name,DisplayName -AutoSize -Wrap
}

function current_user-registro {
    Set-Location hkcu:
    ls
}

function move_to_directory{
    $path = Read-Host -Prompt 'Insert directory to move (remember : for work)'
    Set-Location $path
    ls
}

function view_available_discs{
    Get-PSDrive
}

function search_resource {
    $path = Read-Host -Prompt 'Insert resource to search (separate with ,)'
    Get-ChildItem –Recurse -name | Select-String Policy, Standard
}

while($true){
   $command = Read-Host -Prompt "Insert command";
   Write-Host -"Executing >" $command
   switch ($command) 
    {
        help {available-functions}
        know {know-Host}
        policy {policy} 
        users {users}
        time {current-time} 
        services {view-services} 
        hkcu {current_user-registro}
        cd {move_to_directory}
        discs {view_available_discs}
        search {search_resource}
        ls {ls}
        ip {ipconfig}
        default {"The command is not recogniced"}
    }
   
}

