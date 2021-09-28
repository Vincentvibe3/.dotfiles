$CHOICE = Read-Host "encrypt symmetrically(s) or asymmetrically(a)?"
$CHOICE_2 = Read-Host "Keep tar archive (y/n)?"
$OUTPUT=$(Get-Item $args[0]).basename
tar -czvf temp.tar.gz '$OUTPUT'

switch($CHOICE){
	s{
		gpg -o "$OUTPUT.tar.gz.gpg" -c temp.tar.gz
    }
	a{
		gpg -o "$OUTPUT.tar.gz.gpg" --encrypt temp.tar.gz
    }
}

switch($CHOICE_2){
	y{
		mv temp.tar.gz "$OUTPUT.tar.gz"
    }
	n{
		rm temp.tar.gz
    }
}
