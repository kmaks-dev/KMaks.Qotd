function Get-Qotd {
    [Alias('Get-Quote')]
    [CmdletBinding()]
    param (
        [Parameter()]
        [string[]]
        $Language
    )
    
    begin {}
    
    process {
        if ($Language) {
            $Quotes = $Quotes.Where({$_.Language -in $Language})
        }
        [Quote]::new((Get-Random -InputObject $Quotes)).ToString()
    }
    
    end {}
}