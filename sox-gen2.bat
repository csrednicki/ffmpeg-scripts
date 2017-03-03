@echo off
chcp 65001
REM TODO sortowanie A-Z
REM TODO obsluga znakow innego kodowania

set sfolder=Spectrogram
set tmppng=Spectrogram\tmp_spectrogram.png
set tmpfile=tmp.wav

for /R %%G in (*.mp3 *.m4a) do (
    pushd "%%~dpG"

    if not exist "Spectrogram\%%~nG.webp" (
        echo|set /p="Tworze spektrogram dla %%G ... "

        if not exist %sfolder% (
            mkdir %sfolder%
        )

        if /I "%%~xG"==".mp3" (
            sox "%%~xnG" -n spectrogram -t "%%~xnG" -c "" -x 1000 -o %tmppng%
        )

        if /I "%%~xG"==".m4a" (
            ffmpeg -i "%%~xnG" %tmpfile% 2> NUL
            sox %tmpfile% -n spectrogram -t "%%~xnG" -c "" -x 1000 -o %tmppng%
            del %tmpfile%
        )

        if exist %tmppng% (
            cwebp -quiet -m 6 -q 10 %tmppng% -o "Spectrogram\%%~nG.webp"

            if exist "Spectrogram\%%~nG.webp" (
                del %tmppng%
                echo OK
            )
            if not exist "Spectrogram\%%~nG.webp" (
                echo BLAD
            )
        )
    )

    REM if exist "Spectrogram\%%~nG.webp" (
    REM     echo Spektrogram juz istnieje %%G
    REM )

    popd
)