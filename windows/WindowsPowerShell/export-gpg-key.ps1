$CHOICE = Read-Host "export public only(p) or secret(s) as well?"
$FINAL = 1
if ($(test-path exportedkey)){
    $CHECKCOUNT = 1
    DO {
        try {
            if ($(test-path exportedkey$CHECKCOUNT)){
                throw
            }
            else {
                Rename-Item exportedkey "exportedkey$CHECKCOUNT"
                $FINAL = $CHECKCOUNT
            }
        }
        catch {
        }
        finally{
            $CHECKCOUNT++
            
        }
    } While (test-path exportedkey)
}
mkdir exportedkey > $null
cd exportedkey
switch($CHOICE){
	p{
		gpg -o key --armor --export $args[0]
		$KEYID=$(gpg -k Github | Select-String -Pattern 'pub', 'uid', 'rsa' -notmatch | Out-String).trim()# -replace '\s', '') -replace '\r\n', ''
        $TRUST = $(gpg --export-ownertrust | Select-String $KEYID | Out-String).trim()
        New-Item -Path . -Name "trust" -ItemType "file" > $NULL
        $PATH = (Get-Location).Path
        $PATH = "$PATH/trust"
        [IO.File]::WriteAllLines($PATH, $TRUST)
	}
	
	s{
		gpg -o key --armor --export $args[0]
		gpg -o secret --armor --export-secret-keys $args[0]
		$KEYID=$(gpg -k Github | Select-String -Pattern 'pub', 'uid', 'rsa' -notmatch | Out-String).trim()# -replace '\s', '') -replace '\r\n', ''
        $TRUST = $(gpg --export-ownertrust | Select-String $KEYID | Out-String).trim()
        New-Item -Path . -Name "trust" -ItemType "file" > $NULL
        $PATH = (Get-Location).Path
        $PATH = "$PATH/trust"
        [IO.File]::WriteAllLines($PATH, $TRUST)
	}
}
cd ../
tar -czf exportedkey.tar.gz exportedkey
gpg -o "exportedkey.gpg" -c exportedkey.tar.gz
rm exportedkey.tar.gz
rm -r exportedkey
if ($(test-path exportedkey$FINAL)){
	Rename-Item exportedkey$FINAL exportedkey
}

