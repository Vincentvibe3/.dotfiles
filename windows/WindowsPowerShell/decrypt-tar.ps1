$CHOICE = Read-Host  "Keep encrypted file (y/n)?"
$CHOICE_2 = Read-Host "Keep tar archive (y/n)?"
$OUTPUT=$(Get-Item $args[0]).basename
gpg -o "$OUTPUT.tar.gz" --decrypt $args[0]
tar -xzvf '$OUTPUT.tar.gz'

switch($CHOICE){
	n{
		rm $args[0]
    }
}

switch($CHOICE_2){
	n{
		rm "$OUTPUT.tar.gz"
    }
	
    y{
		REFORMAT1=$(Get-Item $args[0]).basename
		REFORMAT2=$(Get-Item $REFORMAT1).basename
        REFORMAT3=$(Get-Item $REFORMAT2).basename
		mv "$OUTPUT.tar.gz" "$REFORMAT3.tar.gz"
    }
}
