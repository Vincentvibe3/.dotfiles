
$CHOICE = Read-Host "download video(v) or download audio(a) or both(b)?"
$Video = Read-Host "Paste the video URL"
switch($CHOICE)
{
	v{
        youtube-dl $Video
        }

	
	a{
		youtube-dl $Video
		$FILE= youtube-dl --get-filename $Video
		cd "C:/Users/Vincent/Documents/Creative Work/Video/youtube-dl"
		$OUTPUT=$(Get-Item $FILE).basename
		ffmpeg -i "$FILE" "${OUTPUT}.mp3"
		mv "${OUTPUT}.mp3" "C:/Users/Vincent/Documents/Creative Work/Video/youtube-dl/music"
		rm "$FILE"
		}

	b{
		youtube-dl $Video
        	$FILE=$(youtube-dl --get-filename $Video)
		cd "C:/Users/Vincent/Documents/Creative Work/Video/youtube-dl"
		$OUTPUT=$(Get-Item $FILE).basename
        	ffmpeg -i "$(youtube-dl --get-filename $Video)" "${OUTPUT}.mp3"
        	mv "${OUTPUT}.mp3" "C:/Users/Vincent/Documents/Creative Work/Video/youtube-dl/music"
		}
}
