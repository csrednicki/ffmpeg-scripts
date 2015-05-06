# ffmpeg-scripts

### ffaac-folder.bat
Script detects whether the catalog contains subdirectories starting with the "CD". If it finds these directories it opens each of them, encodes and stores the files in the destination directory. CD number is added at the beginning of the filename.
If the directory has no subdirectories then all files are encoded and stored in the destination directory. In this case, the file name is not changed.

### ffcar.bat
Simple script to convert music files (flac, mpc, wav, mp3, m4a) to mp3 vbr mode 5. I use this script to convert the files for mp3 player in my car. This vbr mode will give you the best file size to quality ratio.

### ffcontainer.bat
Changes video file container without reeencoding. Fastest way to create mkv from mp4 video.

### ffflac.bat
Converts all files in directory from wav, ape or wv format to flac.

### ffipad.bat
I use this script to encode movies for my ipad mini. This script is for converting movie files (ex. mp4, mpg, mts) to mp4 with fixed width to 1024 pixels and variable bitrate audio.

### ffx264i2.bat
Converts interlaced mts file to 720p mp4, with much smaller video file.

### test-aac.bat
Encodes test.flac to AAC with different bitrates (128 kbps) and modes (vbr 3,4,5), also creates 320kbps mp3 file for file size and quality comparison. 
