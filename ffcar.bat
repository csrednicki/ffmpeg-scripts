@echo off
mkdir car
for %%a in (*.flac *.mpc *.wav *.mp3 *.m4a) do ffmpeg -i "%%a" -vn -ac 2 -ar 44100 -q:a 5 -f mp3 "car\%%~na.mp3"
pause