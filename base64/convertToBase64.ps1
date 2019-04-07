function convertToBase64
{
    param
    (
        [string] $SourceFilePath,
        [string] $TargetFilePath
    )
    $bufferSize = 9000 # debe ser mmltiplo de 4
    $buffer = New-Object byte[] $bufferSize
    $reader = [System.IO.File]::OpenRead($SourceFilePath)
    $writer = [System.IO.File]::CreateText($TargetFilePath)
    $bytesRead = 0
    do
    {
        $bytesRead = $reader.Read($buffer, 0, $bufferSize);
        $writer.Write([Convert]::ToBase64String($buffer, 0, $bytesRead));

    } while ($bytesRead -eq $bufferSize)
    $reader.Dispose()
    $writer.Dispose()   
}