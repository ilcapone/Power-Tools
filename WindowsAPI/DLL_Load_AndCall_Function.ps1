<#
---------------- Description -----------------------
Load a DLL and call a export function

--------------- CONFIGURE TEMP DIRECTORY -----------

To use de script is necesary change de Tmp dir for cant writ in:

    1 -  $env:TEMP = "D:\temp"
    2 -  $env:TMP = "D:\temp"

--------------- Examples for use -------------------
    
    1 - Load function
    2 - Invoque function --> PS D:\temp> Instantiate-LockDown

#>

function Instantiate-LockDown {
    Add-Type -TypeDefinition @"
    using System;
    using System.Diagnostics;
    using System.Runtime.InteropServices;
     
    public static class Kernel32
    {
        [DllImport("kernel32", SetLastError=true, CharSet = CharSet.Ansi)]
            public static extern IntPtr LoadLibrary(
                [MarshalAs(UnmanagedType.LPStr)]string lpFileName);
             
        [DllImport("kernel32", CharSet=CharSet.Ansi, ExactSpelling=true, SetLastError=true)]
            public static extern IntPtr GetProcAddress(
                IntPtr hModule,
                string procName);
    }
     
    public static class User32
    {
        [DllImport("user32.dll")]
            public static extern IntPtr CallWindowProc(
                IntPtr wndProc,
                IntPtr hWnd,
                int msg,
                IntPtr wParam,
                IntPtr lParam);
    }
"@
     
    $LibHandle = [Kernel32]::LoadLibrary("C:\Windows\System32\user32.dll")
    $FuncHandle = [Kernel32]::GetProcAddress($LibHandle, "LockWorkStation")
     
    if ([System.IntPtr]::Size -eq 4) {
        echo "`nKernel32::LoadLibrary   --> 0x$("{0:X8}" -f $LibHandle.ToInt32())"
        echo "User32::LockWorkStation --> 0x$("{0:X8}" -f $FuncHandle.ToInt32())"
    }
    else {
        echo "`nKernel32::LoadLibrary   --> 0x$("{0:X16}" -f $LibHandle.ToInt64())"
        echo "User32::LockWorkStation --> 0x$("{0:X16}" -f $FuncHandle.ToInt64())"
    }
     
    echo "Locking user session..`n"
    #[User32]::CallWindowProc($FuncHandle, 0, 0, 0, 0) | Out-Null
}
