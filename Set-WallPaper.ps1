Function Set-WallPaper($value)
{
 Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value $value
 rundll32.exe user32.dll, UpdatePerUserSystemParameters
}
curl [Remote url image] -OutFile C:\Users\Public\judia.jpg
Set-WallPaper -value C:\Users\Public\judia.jpg