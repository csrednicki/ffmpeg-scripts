@echo off
for %%a in (*.mts) do ffmpeg -i "%%a" -vf scale="1280:trunc(ow/a/2)*2" -c:v libx264 -crf 26 -flags +ildct+ilme -tune film -strict -2 -ac 2 -c:a aac -q:a 1 "zakodowane\%%~na.mp4"




