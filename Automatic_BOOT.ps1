
# AUDIT BOOT

$dierctory = "Inf_Extract"
$path = ""
$file = "sisInf.txt"
$init_text = "---------  Init BOOT ---------"
$separator = "=============================="

# ------------------ Enviroment functions ---------------
function create_enviroment {
    
    if (-Not (Test-Path $dierctory)){
        New-Item -ItemType directory -Path $dierctory
        cd $dierctory
        crete_fileInf
        $path = pwd 
    }
    else{
        cd $dierctory
        crete_fileInf
        $path = pwd 
    }
}

function crete_fileInf{
    if (-Not (Test-Path $file)){
            New-Item -ItemType file -Path $file
            $init_text | Add-Content $file
     }
}

# ------------------ Extraction info functions ---------------
function extract_info {
    $separator | Add-Content $file
    Get-WmiObject -Class Win32_ComputerSystem | Add-Content $file
    $separator | Add-Content $file
    Get-ExecutionPolicy | Add-Content $file
    $separator | Add-Content $file
    Get-ExecutionPolicy -List | Format-Table -AutoSize | Add-Content $file
    $separator | Add-Content $file
    Get-WmiObject -Class Win32_OperatingSystem -ComputerName . | Select-Object -Property NumberOfLicensedUsers,NumberOfUsers,RegisteredUser | Add-Content $file
    $separator | Add-Content $file
    Get-WmiObject -Class Win32_LocalTime -ComputerName . | Select-Object -Property [a-z]* | Add-Content $file
    $separator | Add-Content $file
    Get-WmiObject -Class Win32_Service -ComputerName . | Format-Table -Property Status,Name,DisplayName -AutoSize -Wrap | Add-Content $file    
    $separator | Add-Content $file
    Set-Location hkcu:
    $hkcu_register = ls
    cd $path
    $hkcu_register | Add-Content $file
    $separator | Add-Content $file
    Get-PSDrive | Add-Content $file
    
}

# ------------------ Init BOOT scritp ---------------
create_enviroment
extract_info
