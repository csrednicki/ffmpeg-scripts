@echo off
mkdir "flac"
for %%a in (*.wav *.ape *.wv) do ffmpeg -i "%%a" "flac\%%~na.flac"
pause
