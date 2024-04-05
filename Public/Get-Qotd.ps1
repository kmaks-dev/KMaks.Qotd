function Get-Qotd {
    [CmdletBinding()]
    param ()
    
    begin {}
    
    process {
        [Quote]::new((Get-Random -InputObject $Quotes)).ToString()
    }
    
    end {}
}