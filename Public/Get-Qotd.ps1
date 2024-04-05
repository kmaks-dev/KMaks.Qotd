function Get-Qotd {
    [CmdletBinding()]
    param ()
    
    begin {}
    
    process {
        $Quote = Get-Random -InputObject $Quotes
        $Quote.ToString()
    }
    
    end {}
}