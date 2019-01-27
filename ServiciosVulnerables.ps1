$Service = gwmi win32_service
foreach ($elemento in $Service)
{
 If ((!$elemento.pathname.Equals(""))-and(!$elemento.pathname.StartsWith('"'))-and($elemento.pathname -ne $null))
  {
   $elem = $elemento.PathName.Split(" ")[0]
   if ((!$elem.Contains(":\Windows")))
   {
    $elemento.PathName
    $elemento.Name
   }
  }
}