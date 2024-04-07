class Quote {
    [string[]] $Author
    [string[]] $Quote
    
    Quote([string]$Author, [string[]]$Quote) {
        $this.Author = $Author
        $this.Quote = Quote
    }
    Quote([hashtable]$Hashtable) {
        $this.Author = $Hashtable.Author
        $this.Quote = $hashtable.Quote
    }

    [string] ToString() {
        # Source: https://learn.microsoft.com/en-us/windows/console/console-virtual-terminal-sequences#text-formatting
        # 0 - Default
        # 1 - Bold/Bright
        # 2 - Dimmed
        # 3 - Italic
        # 4 - Underline
        # 5 - Blinking
        # 6 - Fast blinking (not supported in Windows Terminal)
        # 7 - Inverse color
        $ResetStyle = "`e[0m"
        $QuoteStyle = "`e[1;3m"
        $AuthorStyle = "`e[3m"

        $QuoteLength = $this.Quote | Measure-Object -Maximum -Property Length | Select-Object -ExpandProperty Maximum
        $Margin = 4

        [array] $QuoteStringArray = @()
        $QuoteStringArray += ""
        $QuoteStringArray += $this.Quote.ForEach({
            " " * $Margin + $QuoteStyle + $_ + $ResetStyle
        })
        $QuoteStringArray += ""
        $QuoteStringArray += $this.Author.ForEach({
            $AuthorStyle + $_ + $ResetStyle
        }).PadLeft($Margin + $AuthorStyle.Length + $QuoteLength + $ResetStyle.Length)
        $QuoteStringArray += ""

        return $QuoteStringArray -join "`n"
    }
}