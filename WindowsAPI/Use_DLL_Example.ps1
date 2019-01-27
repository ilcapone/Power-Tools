<#
--------------- CONFIGURE TEMP DIRECTORY -----------

To use de script is necesary change de Tmp dir for cant writ in:

    1 -  $env:TEMP = "D:\temp"
    2 -  $env:TMP = "D:\temp"

--------------- Examples for use -------------------

[User32]::MessageBox(0,"Text","Caption",0) |Out-Null
[User32]::MessageBox(0,"Text","Caption",0x4)

#>

Add-Type -TypeDefinition @"
using System;
using System.Diagnostics;
using System.Runtime.InteropServices;
 
public static class User32
{
    [DllImport("user32.dll", CharSet=CharSet.Auto)]
        public static extern bool MessageBox(
            IntPtr hWnd,     /// Parent window handle 
            String text,     /// Text message to display
            String caption,  /// Window caption
            int options);    /// MessageBox type
}
"@
 

