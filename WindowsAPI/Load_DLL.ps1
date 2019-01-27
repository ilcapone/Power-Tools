<#
---------------- Description -----------------------
Load a DLL in new job

--------------- CONFIGURE TEMP DIRECTORY -----------

To use de script is necesary change de Tmp dir for cant writ in:

    1 -  $env:TEMP = "D:\temp"
    2 -  $env:TMP = "D:\temp"

--------------- Examples for use -------------------
    
    1 - Load function
    2 - Change the DLL path in LoadLibrary function
    3 - Invoque function --> PS D:\temp> Instantiate-MSFDL

#>

function Instantiate-MSFDLL {
    $ScriptBlock = { 
        Add-Type -TypeDefinition @"
        using System;
        using System.Diagnostics;
        using System.Runtime.InteropServices;
         
        public static class Kernel32
        {
            [DllImport("kernel32.dll", SetLastError=true, CharSet = CharSet.Ansi)]
                public static extern IntPtr LoadLibrary(
                    [MarshalAs(UnmanagedType.LPStr)]string lpFileName);
        }
"@  
         
        [Kernel32]::LoadLibrary("C:\Program Files (x86)\Java\jre1.8.0_151\bin\java.dll")
    }
     
    Start-Job -Name MSF_Test -ScriptBlock $ScriptBlock
}
