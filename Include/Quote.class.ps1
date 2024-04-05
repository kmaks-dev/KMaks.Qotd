class Quote {
    [string] $Author
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
        $ResetStyle = "`e[0m"
        $DimmedStyle = "`e[2m"
        $DimmedItalicStyle = "`e[2;3m"
        [array] $QuoteStringArray = @()
        $QuoteStringArray += $this.Quote.ForEach({ "`t" + $DimmedStyle + $_ + $ResetStyle })
        $QuoteStringArray += $this.Author.ForEach({ "`t`t" + $DimmedItalicStyle + "~" + $_ + $ResetStyle })

        return $QuoteStringArray -join "`n"
    }
}