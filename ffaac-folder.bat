@echo off
REM Inicjalizacja zmiennej liczby plyt
set /a cdcounter=0

SET RESULT=---
set OPTIONS=-vn -c:a libfdk_aac -vbr 5

REM Wejscie w tryb
setlocal ENABLEDELAYEDEXPANSION

REM Pobranie nazwy aktualnego katalogu do zmiennej %CurrDirName%
REM parametr %%~nxd rozwija do pelnej nazwy pliku i rozszerzenia
REM Jest to zabezpieczenie na wypadek katalogu z kropka w nazwie
REM Np: Hed Kandi - Disco Kandi 05.02 (2002)
FOR %%d in (.) do set CurrDirName=%%~nxd

REM Ustawienie katalogu docelowego
set cel=m:\# MUZYKA\# Albumy\%CurrDirName%

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
	for %%v in ("%%c\*.flac", "%%c\*.wav") do (
		REM echo Konweruje plik "%cel%\!cdcounter!x%%~nv.m4a"
		ffmpeg-aac -i "%%v" %OPTIONS% "%cel%\!cdcounter!x%%~nv.m4a"
	)
		
)
GOTO END

:SINGLECD
for %%a in (*.flac *.mpc *.wav) do (
	ffmpeg-aac -i "%%a" %OPTIONS% "%cel%\%%~na.m4a"
)

:END
