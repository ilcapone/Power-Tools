Function Send-Email {
[cmdletbinding()]
Param (
    [Parameter(Mandatory=$False)][String]$Address,
    [Parameter(Mandatory=$False)][String]$Subject,
    [Parameter(Mandatory=$False)][String]$Body
)

Begin {
    Clear-Host
} Process {
    $Outlook = New-Object -ComObject Outlook.Application
    $Mail = $Outlook.CreateItem(0)
    $Mail.To = $Address
    $Mail.Subject = $Subject
    $Mail.Body = $Body
    $Mail.Send()
}
}

Send-Email -Address david.gavalda@bdo.es -Subject Check -Body "Esto no es mas que una MFKg PoC!"