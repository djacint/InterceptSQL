param([string]$a)

Function extractSqlQuery
{

    [string]$s1 = ""
    [string]$s2 = ""
    [string]$s3 = ""
    [string]$s4 = ""
    [string]$s5 = ""
    $s1 = (tshark -r $a -T fields -e tds.query) 
    $s2 = $s1.replace("`n`r","").replace("where","`r`twhere").replace("select","`n`rselect").replace("  ","").replace("order by","`r`torder by").replace("from","`r`tfrom") >"c:\_todelete\test_replace.txt"

    

}

if(test-path "c:\_todelete\test.txt")
{
    extractSqlQuery
}
else
{
    New-Item "c:\_todelete\test.txt" -ItemType file
    extractSqlQuery
}



