for %%a in ("*.m*") do ffmpeg -i "%%a" -strict experimental -map 0:0 -map 0:1 -vf scale="1024:trunc(ow/a/2)*2" -c:v libx264 -crf 25 -ac 2 -c:a aac -q:a 0.7 "m:\# FILMY\iPad\%%~na.m4v"