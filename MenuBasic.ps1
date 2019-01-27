Write-Host Menu
Write-Host ====
Write-Host "1) Listar directorrio"
Write-Host "2) Dar la hora"
Write-Host "3) Salir"
Write-Host "Introduce una opcion"
$opcion = Read-Host
switch($opcion)
{
 1 {ls;break}
 2 {date;break}
 3 {exit;break}
 default {break}
}