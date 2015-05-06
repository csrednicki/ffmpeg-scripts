ffmpeg-aac -i test.flac -vn -c:a libfdk_aac -b:a 128k test-128.m4a
ffmpeg-aac -i test.flac -vn -c:a libfdk_aac -vbr 3 test-vbr3.m4a
ffmpeg-aac -i test.flac -vn -c:a libfdk_aac -vbr 4 test-vbr4.m4a
ffmpeg-aac -i test.flac -vn -c:a libfdk_aac -vbr 5 test-vbr5.m4a
ffmpeg -i test.flac -vn -ac 2 -ar 44100 -ab 320k -f mp3 -joint_stereo 1 test.mp3
