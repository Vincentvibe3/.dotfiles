
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


gpg -o importedkey.tar.gz --decrypt $args[0]
tar -xzf importedkey.tar.gz
rm importedkey.tar.gz
cd exportedkey
if ($(test-path key)){
gpg --import key
}
if ($(test-path secret)){
gpg --import secret
}
if ($(test-path trust)){
gpg --import-ownertrust trust
}
cd ../
rm -r exportedkey
if ($(test-path exportedkey$FINAL)){
	Rename-Item exportedkey$FINAL exportedkey
}


