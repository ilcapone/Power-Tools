function listarAtributos
{
    foreach($elemento in Get-ChildItem)
    {
        echo "$($elemento.name) atributos:$($elemento.attributes)"
    }
}