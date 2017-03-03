@echo off
REM Inicjalizacja zmiennej liczby plyt
set /a cdcounter=0

SET PRG=ffmpeg
SET RESULT=---
SET OPTIONS=-vn -ac 2 -ar 44100 -q:a 6 -f mp3 -sample_fmt s16p
SET EXT=mp3
REM SET OPTIONS=-vn -c:a libfdk_aac -vbr 2
REM SET EXT=m4a

REM Wejscie w tryb
setlocal ENABLEDELAYEDEXPANSION

REM Pobranie nazwy aktualnego katalogu do zmiennej %CurrDirName%
REM parametr %%~nxd rozwija do pelnej nazwy pliku i rozszerzenia
REM Jest to zabezpieczenie na wypadek katalogu z kropka w nazwie
REM Np: Hed Kandi - Disco Kandi 05.02 (2002)
FOR %%d in (.) do set CurrDirName=%%~nxd

REM Ustawienie katalogu docelowego
SET cel=m:\# MUZYKA\# SAMOCHOD\%CurrDirName%

FOR /D %%d IN ("CD*") DO (
  SET RESULT=%%d
)

echo Utworzenie katalogu docelowego: %cel%
mkdir "%cel%"

IF EXIST "%RESULT%" (GOTO MULTICD) ELSE (GOTO SINGLECD)

:MULTICD
FOR /D %%c IN ("CD*") DO (
	set /a cdcounter+=1	
	REM echo Katalog %%c
	for %%v in ("%%c\*.flac", "%%c\*.m*", "%%c\*.wav") do (
		REM echo Konweruje plik "%cel%\!cdcounter!x%%~nv.%EXT%"
		%PRG% -i "%%v" %OPTIONS% "%cel%\!cdcounter!x%%~nv.%EXT%"
	)
		
)
GOTO END

:SINGLECD
for %%a in (*.flac *.m* *.wav) do (
	%PRG% -i "%%a" %OPTIONS% "%cel%\%%~na.%EXT%"
)

:END
