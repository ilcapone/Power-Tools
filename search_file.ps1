function shearch_file{

    #Example:
    #
    # > shearch_file "Libro1.xlsm" "D:\"
    #

    param
    (
        [string] $file,
        [string] $directory
    )

    Get-ChildItem -Path $directory -Recurse | where {$_.Name -eq $file}
}