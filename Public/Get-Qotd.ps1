function Get-Qotd {
    [Alias('Get-Quote')]
    [CmdletBinding()]
    param ()
    
    begin {}
    
    process {
        [Quote]::new((Get-Random -InputObject $Quotes)).ToString()
    }
    
    end {}
}